"""
Script to wrap plain-string fieldset titles with _() in all admin.py files
that already have `gettext_lazy as _` imported.
"""
import re
import glob

admin_files = glob.glob("apps/*/admin.py")

# Matches fieldset tuple opener: ('Title', {   or  ("Title", {
# Does NOT match: (None, {  or already wrapped (_("...", {
PLAIN_TITLE_RE = re.compile(r"""\((['"]) ([^'"]+) \1 (\s*,\s*\{)""", re.VERBOSE)


def wrap_title(m):
    quote, title, rest = m.group(1), m.group(2), m.group(3)
    return f'(_("{title}"){rest}'


changed = []
for fpath in sorted(admin_files):
    src = open(fpath, encoding="utf-8").read()
    if "gettext_lazy" not in src:
        print(f"SKIP (no gettext): {fpath}")
        continue

    new_src = PLAIN_TITLE_RE.sub(wrap_title, src)
    if new_src != src:
        open(fpath, "w", encoding="utf-8").write(new_src)
        changed.append(fpath)
        print(f"UPDATED: {fpath}")
    else:
        print(f"unchanged: {fpath}")

print(f"\nDone. {len(changed)} file(s) updated.")
