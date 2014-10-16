class VotesController < ApplicationController
  # This is your first Rails project and you have a lot of complexity here.  I
  # expect this.
  #
  # What I like:
  # * You recognized that a Vote was a resource (even if your routes don't
  # reflect this)
  # * You are extracting methods to deal with the complexity e.g.
  # current_user_vote
  #
  # While I don't expect you to, at this phase, realize techniques that might
  # dig you out, I think you are on a good path.
  #
  # Check out my comments below.

  def up_question_vote
    previous_vote = current_user_vote("Question", session[:question_id])
    if previous_vote == nil
      # How about a Vote.create_upvote method?  You could pass the session and
      # votable id and votable type into it?  Perhaps the calculation of
      # votable id and votable type could be handled in a private method inside
      # this controller?
      @vote = Vote.create(upvote: true, user_id: session[:user_id], voteable_id: session[:question_id], voteable_type: "Question")
      redirect_to "/questions/#{session[:question_id]}" # use named routes
    else
      new_vote = Vote.find(previous_vote.id)
      new_vote.upvote = true
      new_vote.save
      redirect_to "/questions/#{session[:question_id]}"
    end
  end

  def down_question_vote
    previous_vote = current_user_vote("Question", session[:question_id])
    if previous_vote == nil
      @vote = Vote.create(upvote: false, user_id: session[:user_id], voteable_id: session[:question_id], voteable_type: "Question")
      redirect_to "/questions/#{session[:question_id]}"
    else
      new_vote = Vote.find(previous_vote.id)
      new_vote.upvote = false
      new_vote.save
      redirect_to "/questions/#{session[:question_id]}"
    end
  end

  def up_answer_vote
    previous_vote = current_user_vote("Answer", params[:answer_id])
    if previous_vote == nil
      @vote = Vote.create(upvote: true, user_id: session[:user_id], voteable_type: "Answer", voteable_id: params[:answer_id])
      redirect_to "/questions/#{session[:question_id]}"
    else
      new_vote = Vote.find(previous_vote.id)
      new_vote.upvote = true
      new_vote.save
      redirect_to "/questions/#{session[:question_id]}"
    end
  end

  def down_answer_vote
    previous_vote = current_user_vote("Answer", params[:answer_id])
    if previous_vote == nil
      @vote = Vote.create(upvote: false, user_id: session[:user_id], voteable_type: "Answer", voteable_id: params[:answer_id])
      redirect_to "/questions/#{session[:question_id]}"
    else
      new_vote = Vote.find(previous_vote.id)
      new_vote.upvote = false
      new_vote.save
      redirect_to "/questions/#{session[:question_id]}"
    end
  end

  private
  # I like your introduction of this concept.  It's helping you get to a cleaner place.
  def current_user_vote(voteable_type, voteable_id)
    if voteable_type == 'Question'
      user_votes = User.find(session[:user_id]).votes
      previous_vote = user_votes.where(votes: {voteable_type: "Question", voteable_id: voteable_id}).first
    else
      user_votes = User.find(session[:user_id]).votes
      previous_vote = user_votes.where(votes: {voteable_type: "Answer", voteable_id: voteable_id}).first
    end
  end
end
