# Problem Sets
day = 1
add_day = 1
base_date = Date.new(2015, 6, 22)
until day == 16
  if (base_date + add_day).wday.between?(1, 5)
    ProblemSet.create!(title: "Day #{day}", deploy_date: base_date + add_day)
    day += 1
    add_day += 1
  else
    add_day += 1
  end
end

# Questions
Question.create!(title: 'Digital Root', problem_set_id: 1, set_title: 'A',
                 description: 'Write a method, digital_root(num). It should sum the digits of a positive integer. If it is greater than or equal to 10, sum the digits of the resulting number. Keep repeating until there is only one digit in the result, called the "digital root". Do not use string conversion within your method.')

Answer.create!(description: '```ruby
def digital_root(num)
  while num >= 10
    num = digital_root_step(num)
  end

  num
end

def digital_root_step(num)
  root = 0
  while num > 0
    root += (num % 10)

    num /= 10
  end

  root
end

#recursive solution

def digital_root_recur num
  return num if num < 10
  digital_root_recur((num % 10) + (num / 10))
end

```', question_id: 1)

Question.create!(title: 'Caesar Cipher', problem_set_id: 1, set_title: 'A',
                 description: 'Write a function that takes a message and an increment amount and outputs the same letters shifted by that amount in the alphabet. Assume lowercase and no punctuation. Preserve spaces.')

Answer.create!(description: '```ruby
  def caesar_cipher(str, shift)
    letters = ("a".."z").to_a

    encoded_str = ""
    str.each_char do |char|
      if char == " "
        encoded_str << " "
        next
      end

      old_idx = letters.find_index(char)
      new_idx = (old_idx + shift) % letters.count

      encoded_str << letters[new_idx]
    end

    encoded_str
  end
  ```', question_id: 2)

Question.create!(title: 'Common Substrings', problem_set_id: 1, set_title: 'B',
                 description: 'Write a function, `common_substrings(str1, str2)` that takes two strings and returns the longest common substring.')

Answer.create!(description: "```ruby
  def common_substrings(str1, str2)
    longest_substring = ""

    start_idx = 0
    while start_idx < str1.length
      # don't consider substrings that would be too short to beat
      # current max.
      len = longest_substring.length + 1

      while (start_idx + len) <= str1.length
        end_idx = start_idx + len
        substring = str1[start_idx...end_idx]
        longest_substring = substring if str2.include?(substring)

        len += 1
      end

      start_idx += 1
    end

    longest_substring
  end
  ```", question_id: 3)

Question.create!(title: 'Recursive Sum', problem_set_id: 1, set_title: 'B',
                 description: 'Write a function that takes an array of integers and returns their sum. Use recursion.')

Answer.create!(description: "```ruby
  def sum_rec(nums)
    return 0 if nums.empty?
    nums[0] + sum_rec(nums.drop(1))
  end
  ```", question_id: 4)

Question.create!(title: 'Fibonacci', problem_set_id: 2, set_title: 'A', description: 'Write a function, `fibs(num)` which returns the first n elements from the fibonnacci sequence, given n.' )
Question.create!(title: 'isPalindrome', problem_set_id: 2, set_title: 'A', description: "Write a JavaScript function that takes a string and returns true if it's a palindrome, false if it's not. Use Javascript. This solution takes less time and memory than rebuilding the string backward and comparing the two.")
Answer.create!(description: "```ruby
def fibs(num)
  return [] if num == 0
  return [0] if num == 1

  fibs = [0, 1]
  while fibs.count < num
    fibs << fibs[-1] + fibs[-2]
  end

  fibs
end
```", question_id: 5, time_complexity: 'O(n)')
Answer.create!(description: "```js
function isPalindrome (string) {
  var length = string.length;

  for (var i = 0; i < length/2; i++) {
    if (string[i] !== string[length - 1 - i]) {
      return false;
    }
  }

  return true;
}
```", question_id: 6, time_complexity: 'O(n)', space_complexity: 'O(1)')

Question.create!(title: 'Valid IP', problem_set_id: 2, set_title: 'B', description: "Write a method that takes a string as input. It should return true if the input is a valid IPv4 address (ie. anything between `0.0.0.0` and `255.255.255.255` is valid).")
Question.create!(title: 'File Sum', problem_set_id: 2, set_title: 'B', description: 'Write a method that reads in a file of integers, one per line, and sums them. Skip the line if it begins with a `"#"`.')
Question.create!(title: 'Shuffle', problem_set_id: 2, set_title: 'B', description: 'You are given an array and a random number generator. Shuffle the array.')
Answer.create!(description: '
```ruby
def valid_ip?(str)
  return false unless str =~ /^\d+(\.\d+){3}$/
  nums = str.split(".").map(&:to_i)
  nums.all? {|num| num >= 0 && num <= 255}
end
```', question_id: 7)
Answer.create!(description: '```ruby
def sum_from_file(filename)
  nums = File
    .readlines(filename)
    .select { |line| line[0] != "#" }
    .map(&:to_i)

  nums.inject(:+)
end
```', question_id: 8)
Answer.create!(description: '```ruby
def shuffle(array)
  new_array = array.dup
  array.each_index do |index|
    # notice how each time it moves the number at `index` out of the
    # way so it may be sampled later.
    rand_index = index + rand(array.length - index)
    new_array[index], new_array[rand_index] =
      new_array[rand_index], new_array[index]
  end
  new_array
end
```', question_id: 9, time_complexity: 'O(n)')

Question.create!(title: 'myMap', problem_set_id: 3, set_title: 'A', description: "Implement the `Array#map` function in JavaScript.")
Question.create!(title: 'Employees Query', problem_set_id: 3, set_title: 'A', description: "In a SQL db, you have two tables, an employees table and a departments table. Employees belong to only one department. Write a SQL query that, given a department name, finds all the employees in that department.")
Answer.create!(description: "```js
Array.prototype.myMap = function(fn) {
  var final = [];
  this.forEach(function (el) {
    final.push(fn(el));
  });

  return final;
};
```", question_id: 10)
Answer.create!(description: "```sql
SELECT
  employees.*
FROM
  employees e
JOIN
  departments d ON e.department_id = d.id
WHERE
  d.name = ?
```", question_id: 11)

Question.create!(title: 'SQL + ActiveRecord', problem_set_id: 3, set_title: 'B', description: '(from InstaCart) Write the following queries in SQL and in Rails:
* "count all users",
* "count all active users (you define what active means)",
* "count all users who visited the site within a certain time period".')
Question.create!(title: 'Folding Cipher', problem_set_id: 3, set_title: 'B', description: "Implement the Folding Cipher. It folds the alphabet in half and uses the adjacent letter. Ie. a <=> z, b <=> y, c <=> x, m <=> n.")
Answer.create!(description: '```
SELECT
  COUNT(*)
FROM
  users;

User.count
```

```
SELECT
  COUNT(*)
FROM
  users
WHERE
  users.active = true;

User.where(:active => "TRUE").count
```

```sql
SELECT
  COUNT(*)
FROM
  users
WHERE
  users.last_login BETWEEN :time_period_start AND :time_period_end ;

User.where(last_login: (time_period_start..time_period_end)).count
```', question_id: 12)
Answer.create!(description: "
```ruby
def folding_cipher(str)
  # Hash::[] creates a hash from a list of key-value pairs
  folded_alphabet = Hash[('a'..'z').zip(('a'..'z').to_a.reverse)]
  str.chars.map { |chr| folded_alphabet[chr] }.join
end
```", question_id: 13)

Question.create!(title: 'Unique Substrings', problem_set_id: 4, set_title: 'A', description: "
Write a method that finds all the unique substrings for a word.

A results array and the `include?` method can be used to enforce
uniqueness, but it adds the time cost of iterating through that array
to check for inclusion. Keeping track of substrings in a hash is more
efficient.")
Question.create!(title: 'Largest Continuous Subsum', problem_set_id: 4, set_title: 'A', description: "
Given an array of integers (positive and negative) find the largest contiguous subsum (sum of a subarray).

You can solve this trivially in `O(n**2)` time by considering all subarrays. Try to solve it in `O(n)` time with `O(1)` memory.

**Hint**:

Say for an array of `n` elements you know:

* The largest contiguous subsum, AND
* The largest contiguous subsum **ending at the last of `n`
  elements**.

Now, say that you extend the `n` elements with an `n+1`th element. How does the largest contiguous subsum ending at the `n+1`th element change?
How does the largest contiguous subsum change?

Illustration:


```
Suppose your array is [5, 3, -7, 6], then:

* The largest subsum is 8 with subarray [5, 3].
* The largest subsum ending at the last element is 7 with subarray [5, 3, -7, 6].

Say that you push 4 to the array to get [5, 3, -7, 6, 4].

* The largest subsum ending at the last element is 11 with subarray [5, 3, -7, 6, 4].
* The largest subsum overall is the max of the old largest subsum AND the new largest subsum.
In other words, the new largest sum is 11 because [8, 11].max = 11.
```
")
Answer.create!(description: "
```ruby
def uniq_subs(str)
  subs = {}

  str.length.times do |i|
    (i...str.length).each do |j|
      subs[str[i..j]] = true
    end
  end

  subs.keys
end
```", question_id: 14, time_complexity: 'O(n^2)')
Answer.create!(description: "```ruby
def lcs(arr)
  lcs_helper(arr)[:best_sum]
end

def lcs_helper(arr)
  if arr.empty?
    return { best_sum: 0, best_suffix_sum: 0 }
  end

  result = lcs_helper(arr.drop(1))
  old_best_sum, old_best_suffix_sum = result[:best_sum], result[:best_suffix_sum]
  new_best_suffix_sum = [old_best_suffix_sum + arr.first, arr.first].max
  new_best_sum = [old_best_sum, new_best_suffix_sum].max

  { best_sum: new_best_sum,
    best_suffix_sum: new_best_suffix_sum }
end
```

For a non-recursive solution:

```ruby
def lcs(arr)
    current_sum = 0
    max = arr.first || 0  # return 0 for empty array

    arr.each do |el|
        current_sum += el
        max = currrent_sum if max < current_sum
        current_sum = 0 if current_sum < 0
    end

    max
end
```", question_id: 15)
Question.create!(title: 'Silly Years', problem_set_id: 4, set_title: 'B', description: "Write a function that takes a year (four digit integer) and returns an array with the 10 closest subsequent years that meet the following condition: the first two digits summed with the last two digits are equal to the middle two digits. E.g.,
    1978 => 19 + 78 = 97
    2307 => 23 + 07 = 30")
Question.create!(title: 'Pair Sum', problem_set_id: 4, set_title: 'B', description: "```ruby
require 'set'

def pair_sum(arr, k)
  seen = Set.new
  pairs = Set.new

  arr.each do |num|
    target = k - num

    if seen.include?(target)
      # add in [min, max] order
      pairs.add(
        [[num, target].min, [num, target].max]
      )
    end

    # add `num` after checking; what if we put this before and there's
    # a single `0` is in the `arr`?
    seen.add(num)
  end

  pairs
end

pair_sum([1, 2, -1], 0)          # => #<Set: {[-1, 1]}>
pair_sum([1, 2, -1, -1], 0)      # => #<Set: {[-1, 1]}>
pair_sum([1, 2, -1, -1, -2], 0)  # => #<Set: {[-1, 1], [-2, 2]}>
pair_sum([1, 2, -1, -1, -2], 1)  # => #<Set: {[-1, 2]}>
pair_sum([1, 2, -1, -1, -2], -1) # => #<Set: {[-2, 1]}>
```")
Answer.create!(description: "
There's also a more efficient deductive solution, courtesy of [@joshuameisel][josh-meisel-handle].

We're only looking at 4-digit years, all in the form 'abcd' (in 1987, a = 1, b = 9, c = 8, d = 7).
*'The first two digits plus the last two equal the middle two'* means *'ab + cd = bc'*.
But ab is really 10 * a + b (as in 87 is 8 * 10 + 7). So we reformulate *'ab + cd = bc'*
as (10 * a + b) + (10 * c + d) = (10 * b + c).
Subtracting by the right side we get: (10 * a + b) + (10 * c + d) - (10 * b + c) = 0.
Combine like terms:
10 * a - 9 * b + 9 * c + d = 0.
We can manipulate the left side further. It's equal to:
a + 9a - 9b + 9c + d = a + 9a + 9(-b) + 9c + d = a + 9(a - b + c) + d = 0
So:
a + d = -9(a - b + c)

We've proven that a + d is a multiple of 9. We also know that a and d, being digits, are between 0 and nine inclusive.
So a + d is in between 0 + 0 = 0 and 9 + 9 = 18. It has to be 0, 9, or 18. It can't be 0 (there's no year 0870). a + d also can't be 18, because that would mean a and d are both 9. In the year 9bc9, 9b + c9 is at least 99, meaning b and c would also be at least 9. We know 9999 does not match the pattern we're looking for.

We're now proven that
* a + d = 9
* a - b + c = -1

Given the above, we can figure out what d and c must be once we know a and b. This means there is at most one silly year per century. On our input year, we simply iterate up subsequent centuries to see if any of them have a silly year. A century tells us a and b, from which we derive c and d. If c and d are both between 0 and 9, abcd is a silly year.

[josh-meisel-handle]: https://github.com/joshuameisel", question_id: 16)
Answer.create!(description: "```ruby
require 'set'

def pair_sum(arr, k)
  seen = Set.new
  pairs = Set.new

  arr.each do |num|
    target = k - num

    if seen.include?(target)
      # add in [min, max] order
      pairs.add(
        [[num, target].min, [num, target].max]
      )
    end

    # add `num` after checking; what if we put this before and there's
    # a single `0` is in the `arr`?
    seen.add(num)
  end

  pairs
end

pair_sum([1, 2, -1], 0)          # => #<Set: {[-1, 1]}>
pair_sum([1, 2, -1, -1], 0)      # => #<Set: {[-1, 1]}>
pair_sum([1, 2, -1, -1, -2], 0)  # => #<Set: {[-1, 1], [-2, 2]}>
pair_sum([1, 2, -1, -1, -2], 1)  # => #<Set: {[-1, 2]}>
pair_sum([1, 2, -1, -1, -2], -1) # => #<Set: {[-2, 1]}>
```", question_id: 17, time_complexity: 'O(n)')


Question.create!(title: 'Matrix Region Sum', problem_set_id: 5, set_title: 'A', description: "Given a matrix of integers and coordinates of a rectangular region within the matrix, find the sum of numbers falling inside the rectangle.")
Question.create!(title: 'Merge Sort', problem_set_id: 5, set_title: 'A', description: "Implement merge sort.")
Answer.create!(description: "```ruby
def matrix_region_sum(matrix, top_left_coords, bottom_right_coords)
  total_sum = 0

  (top_left_coords[0]..bottom_right_coords[0]).each do |row_idx|
    (top_left_coords[1]..bottom_right_coords[1]).each do |col_idx|
      total_sum += matrix[row_idx][col_idx]
    end
  end

  total_sum
end
```", question_id: 18, time_complexity: "O(number of columns * number of rows)
This is the best possible because we have to add every one of the numbers in the rectangle. Anything less would require us to skip numbers.")
Answer.create!(description: "```ruby
def merge_sort(array)
  # already sorted
  return array if array.count < 2

  middle = array.count / 2
  left, right = array.take(middle), array.drop(middle)

  sorted_left, sorted_right = merge_sort(left), merge_sort(right)

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged_array = []
  until left.empty? || right.empty?
    merged_array <<
      ((left.first < right.first) ? (left.shift) : (right.shift))
  end

  merged_array + left + right
end

def merge(left, right)
  merged_array = []
  i, j = 0, 0
  until i == left.length || j == right.length
    if left[i] > right[j]
      merged_array << right[j]
      j += 1
    else
      merged_array << left[i]
        i += 1
    end
  end
  merged_array + left.drop(i) + right.drop(j)
end
```", question_id: 19, time_complexity: "O(n*log(n))")

Question.create!(title: 'Binary Search', problem_set_id: 5, set_title: 'B', description:  "Implement binary search.")
Question.create!(title: 'Productify', problem_set_id: 5, set_title: 'B', description: "Given a list of numbers in an array, replace all the numbers with the product of all other numbers. Do this in `O(n)` time **without using division**.")
Answer.create!(description: "
```ruby
def binary_search(array, target)
  return nil if array.count == 0

  midpoint = array.length / 2
  case target <=> array[midpoint]
  when -1
    binary_search(array.take(midpoint), target)
  when 0
    midpoint
  when 1
    subproblem_answer =
      binary_search(array.drop(midpoint + 1), target)
    subproblem_answer.nil? ? nil : (midpoint + 1) + subproblem_answer
  end
end", question_id: 20, time_complexity: 'O(log(n))')
Answer.create!(description: "```ruby
def productify(arr)
  # Build two arrays
  # * `left_arr[i]` is the product of all `arr[j]` for `j < i`
  # * `right_arr` is the product of all `arr[j]` for `j > i`
  products = Array.new(arr.length, 1)

  lower_prod = 1
  0.upto(arr.size - 1) do |i|
    products[i] = products[i] * lower_prod
    lower_prod = lower_prod * arr[i]
  end

  upper_prod = 1
  (arr.size - 1).downto(0) do |i|
    products[i] = products[i] * upper_prod
    upper_prod = upper_prod * arr[i]
  end

  products
end
```", question_id: 21)

Question.create!(title: 'Subsets', problem_set_id: 6, set_title: 'A', description: "Write a function that takes an array and returns all of its subsets. How many sets will it return?" )
Question.create!(title: 'Longest Palindrome', problem_set_id: 6, set_title: 'A', description: "Write a function that will take a string and return the indices of the start/end of the longest palindrome it contains.
Your palindrome checker could reverse the string and compare it to the original, but that takes extra memory (that takes `O(n)` extra memory). Instead, you should be able to solve the problem with `O(1)` memory.")
Answer.create!(description: "```ruby
def subsets(arr)
  return [[]] if arr.empty?

  val = arr[0]
  subs = subsets(arr.drop(1))
  new_subs = subs.map { |sub| sub + [val] }

  subs + new_subs
end
```", question_id: 22)
Answer.create!(description: "```ruby
def longest_palindrome(string)
  best_palindrome_start = 0
  best_palindrome_len = 0

  0.upto(string.length - 1).each do |start|
    # micro-optimization: don't look at substrings shorter than best
    # palindrome.
    len = best_palindrome_len + 1
    while start + len <= string.length
      if is_palindrome?(string, start, len)
        best_palindrome_start, best_palindrome_len = start, len
      end

      len += 1
    end
  end

  [best_palindrome_start, best_palindrome_start + best_palindrome_len - 1]
end

def is_palindrome?(string, start, len)
  len.times do |i|
    if string[start + i] != string[(start + len - 1) - i]
      return false
    end
  end

  true
end
```

**TODO**: is there a way to do this not `O(n**2)`?
[Manacher's Algorithm](http://en.wikipedia.org/wiki/Longest_palindromic_substring) solves this in `O(n)`
[Someone's ruby implementation](https://github.com/billymonk/algorithms/blob/master/ruby/manacher.rb)", question_id: 23, time_complexity: "O(n^2)")

Question.create!(title: 'Fast Intersection', problem_set_id: 6, set_title: 'B', description: "Given `arr1` and `arr2`, find the intersection of both sets. It should be trivial to write an `O(n**2)` solution. Use sorting to solve in `O(nlog(n))`. Next, improve this to `O(n)` time (maybe use a non-array datastructure).")
Question.create!(title: 'Common Subsets', problem_set_id: 6, set_title: 'B', description: "
Write a function that takes two arrays (`arr1` and `arr2`) of integers and returns an array with all the subsets commmon to both.
Don't generate all subsets of `arr1` and `arr2`, which would take time exponential in the size of `arr1`/`arr2` (and take `O(2**n)` memory as well). Instead, directly generate the subsets of both.")
Question.create!(title: 'Can Win', problem_set_id: 6, set_title: 'B', description: "Given an array and index, find if it's possible to reach 0 by starting at the index and repeatedly moving left/right by the distance found at `array[index]`.
Hint: Use memoization to record where you've been.")
Answer.create!(description: "```ruby
def intersection1(arr1, arr2)
  arr1.uniq.select { |el| arr2.include?(el) }
end

def intersection2(arr1, arr2)
  arr1, arr2, idx1, idx2 = arr1.sort, arr2.sort, 0, 0

  intersection = []
  while idx1 < arr1.length && idx2 < arr2.length
    case arr1[idx1] <=> arr2[idx2]
    when -1
      idx1 += 1
    when 0
      intersection << arr1[idx1]
      idx1 += 1
      idx2 += 1
    when 1
      idx2 += 1
    end
  end
  intersection
end


def intersection3(arr1, arr2)
  seen = Hash.new(0)
  intersection = []
  arr1.each { |el| seen[el] += 1 }

  arr2.each do |el|
    intersection << el if seen[el] > 0
    seen[el] -= 1
  end

  intersection
end```", question_id: 24)
Answer.create!(description: "```ruby
def common_subsets(arr1, arr2)
  subsets(intersection3(arr1, arr2))
end

def subsets(arr)
  return [[]] if arr.empty?

  val = arr[0]
  subs = subsets(arr.drop(1))
  new_subs = subs.map { |sub| sub + [val] }

  subs + new_subs
end
```
", question_id: 25)
Answer.create!(description: "```ruby
# A non-recursive solution.
def can_win(array, index)
  positions_to_try = [index]
  visited_positions = Array.new(array.length, false)
  visited_positions[index] = true

  until positions_to_try.empty?
    # TA: We should probably use a queue for this.
    position = positions_to_try.shift
    value = array[position]

    if value == 0
      return true
    end

    [position + value, position - value].each do |pos|
      next if visited_positions[pos]
      next if (pos < 0 || array.length <= pos)

      positions_to_try << pos
      # This insures we don't add a position twice to our queue.
      visited_positions[pos] = true
    end
  end

  false
end
```", question_id: 26)

# Question.create!(title: '', problem_set_id: 7, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 7, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 7, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 7, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 8, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 8, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 8, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 8, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 9, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 9, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 9, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 9, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 10, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 10, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 10, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 10, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 11, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 11, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 11, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 11, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 12, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 12, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 12, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 12, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 13, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 13, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 13, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 13, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 14, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 14, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 14, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 14, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 15, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 15, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 15, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 15, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
#
# Question.create!(title: '', problem_set_id: 16, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 16, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Question.create!(title: '', problem_set_id: 16, set_title: '', description: )
# Question.create!(title: '', problem_set_id: 16, set_title: '', description: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
# Answer.create!(description: "", question_id: , time_complexity: , space_complexity: )
