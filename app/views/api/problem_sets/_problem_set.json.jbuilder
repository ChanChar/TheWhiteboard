json.extract! problem_set, :id, :title
json.due_date time_tag(problem_set.deploy_date)
json.complete problem_set.deploy_date <= Time.zone.now
json.today problem_set.deploy_date == Date.today

json.problemsA do
  json.array! problem_set.problems do |problem|
    if problem.set_title == 'A'
      json.partial! 'api/questions/question', question: problem
    end
  end
end

json.problemsB do
  json.array! problem_set.problems do |problem|
    if problem.set_title == 'B'
      json.partial! 'api/questions/question', question: problem
    end
  end
end
