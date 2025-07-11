if [[ $EUID -ne 0 ]]; then
  echo "Run as: sudo"
  echo "Usage: sudo $0 <package-list-file>"
  exit 1
fi

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <package-list-file>"
  exit 1
fi

pkg_list_file="$1"

if [[ ! -f "$pkg_list_file" ]]; then
  echo "Not Found: $pkg_list_file"
  exit 1
fi

# Stats
total_packages=0
packages_found=0
packages_not_found=0
files_deleted=0
dirs_deleted=0
files_skipped=0

while IFS= read -r pkg; do
  [[ -z "$pkg" ]] && continue
  ((total_packages++))

  echo "Processing Package: $pkg"

  if ! pkgutil --pkg-info "$pkg" >/dev/null 2>&1; then
    echo "  Package Not Found: $pkg"
    ((packages_not_found++))
    continue
  fi

  ((packages_found++))

  pkgutil --files "$pkg" | while IFS= read -r relpath; do
    filepath="/$relpath"
    if [[ -f "$filepath" ]]; then
      echo "  Deleting File: $filepath"
      sudo rm -f "$filepath"
      ((files_deleted++))
    elif [[ -d "$filepath" ]]; then
      echo "  Deleting Directory (if empty): $filepath"
      if sudo rmdir "$filepath" 2>/dev/null; then
        ((dirs_deleted++))
      fi
    else
      echo "  Skipping Missing File: $filepath"
      ((files_skipped++))
    fi
  done

  echo "  Forgetting Package Receipt: $pkg"
  sudo pkgutil --forget "$pkg"

done < "$pkg_list_file"

# Summary
echo ""
echo "Cleanup Summary"
echo "---------------------------"
echo "Packages Listed        : $total_packages"
echo "Packages Found         : $packages_found"
echo "Packages Not Found     : $packages_not_found"
echo "Files Deleted          : $files_deleted"
echo "Dirs Deleted (emptied) : $dirs_deleted"
echo "Missing Files Skipped  : $files_skipped"
echo "---------------------------"
echo "Done"
