{total+=$1;c++}

END{
  OFMT="%.6f"
  print total/NR
}
