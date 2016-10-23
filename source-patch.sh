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
sed -i 's/7.0/7.1/g' core/version_defaults.mk;
sed -i 's/NRD90M/NDE63P/g' core/build_id.mk;
git add -A; git commit -m "NDE63P";
croot;
# ==========================================================
# device/qcom/sepolicy
croot;
cd device/qcom/sepolicy;
git fetch https://github.com/AgentFabulous/android_device_qcom_sepolicy aosp7.1;
git cherry-pick f617699a2ef6b2d791f2bc3d1775e2c850773ea8;
git cherry-pick 9126ab94dd43271219036aa8928bf19a3e74c91d;
croot;
# ==========================================================
# bionic
croot;
cd bionic;
git fetch https://github.com/AgentFabulous/android_bionic aosp7; 
git cherry-pick 60c3205f3abf8949f97dcb57319d675b06e8fda6;
git stash -u;
croot;
# ==========================================================
# vold
croot;
cd system/vold;
git fetch https://github.com/AgentFabulous/android_system_vold aosp7;
git cherry-pick 903883fb89e6f37e63232b9185b012323dd8e7a0;
git cherry-pick f56ed9d3abfa71f0df838d1e9ffc7d4c2f415103;
git stash -u;
croot;
# ==========================================================
# frameworks/av 
croot;
cd frameworks/av;
git fetch http://review.cyanogenmod.org/CyanogenMod/android_frameworks_av refs/changes/40/165140/3 && git cherry-pick FETCH_HEAD;
git stash -u;
croot;
# ==========================================================
# frameworks/base
croot;
cd frameworks/base;
git fetch https://github.com/AgentFabulous/platform_frameworks_base aosp7;
git cherry-pick 42b41a284bb8009ab8c620490ff3ed02f913b84d;
git stash -u;
croot;
# ==========================================================
# packages/apps/Music
croot;
cd packages/apps/Music/;
git reset --hard HEAD; git stash -u;
git fetch aosp master;
git cherry-pick 6036ce6127022880a3d9c99bd15db4c968f3e6a3;
git reset --hard HEAD; git stash -u;
croot;
# ==========================================================
# hardware/qcom/display
croot;
cd hardware/qcom/display/;
git fetch https://github.com/Rashed97/android_hardware_qcom_display cm-14.0;
git cherry-pick c51d1a2f69cf68f78c324e13b2bee0f98218388a;
git reset --hard HEAD; git stash -u;
sed -i 's/struct copybit_rect_t dr = { 0, 0, dst->w, dst->h }/struct copybit_rect_t dr = { 0, 0, (int)dst->w, (int)dst->h }/g' msm8960/libcopybit/copybit_c2d.cpp;
sed -i 's/struct copybit_rect_t sr = { 0, 0, src->w, src->h }/struct copybit_rect_t sr = { 0, 0, (int)src->w, (int)src->h }/g' msm8960/libcopybit/copybit_c2d.cpp;
git add -A; git commit -m "msm8960: Add typecasts";
croot;
# ==========================================================

