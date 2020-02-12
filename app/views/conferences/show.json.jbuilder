json.partial! "conferences/conference", conference: @conference
json.talks @conference.talks, partial: "talks/talk", as: :talk
