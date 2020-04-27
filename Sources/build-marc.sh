mkdir -p ../fonts ../fonts/ttfs ../fonts/otf ../fonts/variable
VF_FILENAME=../fonts/variable/Varta\[wght]\.ttf

# Generating VFs
fontmake -g Varta.glyphs -o variable --output-path $VF_FILENAME

# Post processing
ttfautohint $VF_FILENAME $VF_FILENAME.fix
mv $VF_FILENAME.fix $VF_FILENAME

gftools fix-hinting $VF_FILENAME
mv $VF_FILENAME.fix $VF_FILENAME

gftools fix-dsig -f $VF_FILENAME

gftools fix-unwanted-tables $VF_FILENAME -t MVAR

rm -rf master_ufo/ instance_ufo/