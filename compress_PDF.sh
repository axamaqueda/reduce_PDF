#!/bin/bash

# 111 select compression level
# /screen 72 dpi    /ebook 150 dpi    /printer 300 dpi    /prepress 300 dpi    /default  default dpi setting
compression="/printer"

echo " "
echo "Ghostscript compression level: $compression "
echo " "

# 222 set INPUT and OUTPUT folders

input_folder="D:/work/Tulum/09_TEX/thesis_Axa/figures/tex_figures/chapter_04_tex/"

output_folder="D:/work/Tulum/09_TEX/thesis_Axa/figures/tex_figures/chapter_04_tex/chapter_4_ghostscript_compression/"


# 333 capture INPUT filename

pushd $input_folder
echo " "
echo "Input folder: $input_folder"

echo " "
echo "PDF to compress filename [Enter]"
read -e file_in
echo " "

#popd
#echo " "

# 444 concatenate INPUT and OUTPUT

input=$input_folder$file_in
echo " "
echo "Input file: $input"
echo " "


name="${file_in%%.*}"
out_name="_comp.pdf"

output=$output_folder$name$out_name
echo " "
echo "Output file: $output"
echo " "


# 555 EXECUTE =)
/cygdrive/c/pdfsizeopt/pdfsizeopt_gswin/./gswin32c.exe -sDEVICE=pdfwrite -dMaxSubsetPct=100 -dPDFSETTINGS=$compression -sOutputFile="$output" -dNOPAUSE -dBATCH "$input"

#/cygdrive/c/pdfsizeopt/pdfsizeopt_gswin/./gswin32c.exe -sDEVICE=pdfwrite -dMaxSubsetPct=100 -dPDFSETTINGS=/ebook -sOutputFile="outfile.pdf" -dNOPAUSE -dBATCH "03_fig_33_porous_walls.pdf"
