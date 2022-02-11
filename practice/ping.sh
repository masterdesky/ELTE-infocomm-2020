#!/usr/bin/bash
PATH="/home/masterdesky/Documents/GitHub/ELTE_Info_Com_Mod_2021/practice/data/"

while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "ping - attempt to capture frames"
      echo " "
      echo "ping [options]"
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "-t, --target=TARGET       specify the target to be pinged"
      echo "-o, --output=OUTPUT       specify the output file's name"
      exit 0
      ;;
    -t)
      shift
      if test $# -gt 0; then
        export TARGET=$1
      else
        echo "no target specified"
        exit 1
      fi
      shift
      ;;
    --target*)
      export TARGET=`echo $1'`
      shift
      ;;
    -o)
      shift
      if test $# -gt 0; then
        export OUTPUT=$1
      else
        echo "no output file specified"
        exit 1
      fi
      shift
      ;;
    --output*)
      export OUTPUT=`echo $1`
      shift
      ;;
    *)
      break
      ;;
  esac
done

echo "Pinging target... $TARGET"
echo "Writing files to $PATH$OUTPUT"

/usr/bin/ping -D -i 1 -s 32 "$TARGET" |& /usr/bin/tee "$PATH$OUTPUT"
