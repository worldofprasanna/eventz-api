json.partial! 'conferences/conference', conference: @conference
json.talks @conference.talks, partial: 'talks/talk', as: :talk
json.speakers @conference.speakers, partial: 'speakers/speaker', as: :speaker