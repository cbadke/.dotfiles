NR==1  {max=$1}

$1>=max{max=$1}

END{
  OFMT="%.6f"
  print max
}
