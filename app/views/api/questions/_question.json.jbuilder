json.extract! question, :title, :description

json.answers do
  json.array! question.answers do |answer|
    json.partial! 'api/answers/answer', answer: answer
  end
end

json.hints do
  json.array! question.hints do |hint|
    json.partial! 'api/hints/hint', hint: hint
  end
end
