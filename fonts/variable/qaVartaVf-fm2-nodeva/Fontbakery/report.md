## Fontbakery report

Fontbakery version: 0.7.24

<details>
<summary><b>[2] Varta[wght].ttf</b></summary>
<details>
<summary>🔥 <b>FAIL:</b> A static fonts directory with at least two fonts must accompany variable fonts</summary>

* [com.google.fonts/check/repo/vf_has_static_fonts](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/repo/vf_has_static_fonts)
<pre>--- Rationale ---

Variable font family directories kept in the google/fonts git repo must include
a static/ subdir containing static fonts.
These files are meant to be served for users that still lack support for
variable fonts in their web browsers.


</pre>

* 🔥 **FAIL** Please create a subdirectory called "static/" and include in it static font files. [code: missing]

</details>
<details>
<summary>⚠ <b>WARN:</b> Is there kerning info for non-ligated sequences?</summary>

* [com.google.fonts/check/kerning_for_non_ligated_sequences](https://font-bakery.readthedocs.io/en/latest/fontbakery/profiles/googlefonts.html#com.google.fonts/check/kerning_for_non_ligated_sequences)
<pre>--- Rationale ---

Fonts with ligatures should have kerning on the corresponding non-ligated
sequences for text where ligatures aren&#x27;t used (eg
https://github.com/impallari/Raleway/issues/14).


</pre>

* ⚠ **WARN** GPOS table lacks kerning info for the following non-ligated sequences:
	- f + f
	- f + i
	- i + l

   [code: lacks-kern-info]

</details>
<br>
</details>

### Summary

| 💔 ERROR | 🔥 FAIL | ⚠ WARN | 💤 SKIP | ℹ INFO | 🍞 PASS | 🔎 DEBUG |
|:-----:|:----:|:----:|:----:|:----:|:----:|:----:|
| 0 | 1 | 1 | 72 | 7 | 86 | 0 |
| 0% | 1% | 1% | 43% | 4% | 51% | 0% |

**Note:** The following loglevels were omitted in this report:
* **SKIP**
* **INFO**
* **PASS**
* **DEBUG**
