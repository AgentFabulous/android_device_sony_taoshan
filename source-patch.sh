# ==========================================================
# Repo root
if [ -z "$(type -t croot)" ]; then
  while [ ! -e './build/envsetup.sh' ]; do
    cd ../;
  done;
  source ./build/envsetup.sh;
fi;
croot;
# ==========================================================
# build
croot;
cd build/;
git fetch http://github.com/AdrianDC/android_development_backup n_build;
git reset --hard FETCH_HEAD; git stash -u;
croot;
sed -i 's/NRD90M/NBD90Z/g' build/core/build_id.mk;
# ==========================================================
# sepolicy
croot;
sed -i 's/# attribute qti_debugfs_domain/attribute qti_debugfs_domain/g' device/qcom/sepolicy/common/attributes;
sed -i 's/allow audioserver debugfs:file rw_file_perms/#allow audioserver debugfs:file rw_file_perms/g' device/qcom/sepolicy/common/audioserver.te;
# ==========================================================

