num = Channel.from(3..5)

process test {
  input:
  val x from num

  """
  date > d.txt
  """
}
