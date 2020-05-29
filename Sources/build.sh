# source venv/bin/activate
set -e

mkdir -p ../fonts ../fonts/ttfs ../fonts/otf ../fonts/variable ../fonts/woff2

echo "GENERATING TTFs"
fontmake -g Varta.glyphs -i -o ttf --output-dir ../fonts/ttfs/

echo "POST PROCESSING TTFs"
ttfs=$(ls ../fonts/ttfs/*.ttf)
for ttf in $ttfs
do
	ttfautohint $ttf "$ttf.fix";
	mv "$ttf.fix" $ttf;

    gftools fix-hinting $ttf;
    mv "$ttf.fix" $ttf;

    gftools fix-dsig -f $ttf;
done

echo "GENERATING WOFFs"
ttfs=$(ls ../fonts/*/*.ttf)
for ttf in $ttfs; do
    woff2_compress $ttf
done

woff2s=$(ls ../fonts/*/*.woff2)
for woff2 in $woff2s; do
    mv $woff2 ../fonts/woff2/$(basename $woff2)
done


echo "GENERATING OTFs"
fontmake -g Varta.glyphs -i -o otf --output-dir ../fonts/otf/

echo "POST PROCESSING OTFs"
otfs=$(ls ../fonts/otf/*.otf)
for otf in $otfs
do
    gftools fix-dsig -f $otf;
done

echo "GENERATING VFs"
VF_FILE=../fonts/variable/Varta\[wght]\.ttf
fontmake -g Varta.glyphs -o variable --output-path $VF_FILE

rm -rf master_ufo/ instance_ufo/

echo "POST PROCESSING VFs"
ttfautohint $VF_FILE $VF_FILE.fix
mv $VF_FILE.fix $VF_FILE

gftools fix-hinting $VF_FILE
mv $VF_FILE.fix $VF_FILE

gftools fix-dsig -f $VF_FILE

gftools fix-unwanted-tables $VF_FILE -t MVAR

python3 varta-stat-table2.py $VF_FILE