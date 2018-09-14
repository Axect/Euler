proc main() {
  const result = + reduce [i in 1..999] if (i%3 == 0 || i%5 == 0) then i;
  writeln(result);
}
