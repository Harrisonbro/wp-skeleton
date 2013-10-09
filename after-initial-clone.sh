# Disassociate this clone from main repo
git remote rm origin

# Removed cached history of submodules
git rm --cached wp
git rm --cached content/themes/wp-skeleton-theme
git rm --cached content/plugins/wordpress-seo
git rm --cached content/plugins/w3-total-cache

# Remove submodules
git rm .gitmodules

# Remove .git folders in submodules
rm -rf wp/.git
rm -rf content/themes/wp-skeleton-theme/.git
rm -rf content/plugins/wordpress-seo/.git
rm -rf content/plugins/w3-total-cache/.git

# Re-add submodule folders
git add wp
git add content/themes/wp-skeleton-theme
git add content/plugins/wordpress-seo
git add content/plugins/w3-total-cache

# Commit
git commit -m "De-submoduled submodules"