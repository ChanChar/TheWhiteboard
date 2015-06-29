json.array!(@problem_sets) do |problem_set|
  json.partial! 'api/problem_sets/problem_set', problem_set: problem_set
end
