---- setup requirements  ----

The Magic uses HTC offsets for the kernel in the boot.img, and not the
usual Google offsets. To build functional boot.img files, you must have
a couple changes from Donut to build a mkbootimg that supports the 
"--base" argument. From your Android repository root, execute the following
to cherry-pick the changes into your build:

pushd build
git cherry-pick 1e0847c2fcbe1b95464f32a719d2b9e620d1e6ec
git cherry-pick 6ea3b8856d656752c0310ca237ed99e7451be83b
popd

pushd system/core
git cherry-pick 67eacb9affe645dea23c753fcca0776c33a5eb2a

---- easy setup method ----

The preferred setup is by using a local_manifest.xml in your .repo
directory. But if for some reason you don't want to do that, you can do the
following.
Starting from the root of your source tree, check out the project:

cd vendor/htc
git clone git://github.com/koush/platform_vendor_htc_magic-open.git magic-open

---- preferred setup using a .repo/local_manifest.xml ----

You can also add the reference to this project in a local_manifest.xml.
The file would need to contain atleast the following:

<?xml version="1.0" encoding="UTF-8"?>
<manifest>
    <remote name="github" fetch="git://github.com/" />
    <project path="vendor/htc/magic-open" name="koush/platform_vendor_htc_magic-open" revision="refs/heads/master" remote="github" />
</manifest>

After that file is modified/created, simply run:

repo sync

---- build configuration ----

You can configure to build for HTC Magicby setting
your environment at the root of the source tree:

. build/envsetup.sh
lunch htc_magic-eng

---- proprietary files ----

The HTC Magic device includes a small number of proprietary binary 
files that are necessary for Android to work correctly on it.

They can be obtained from your Dream device by running the
extract-files.sh script in this directory.  It will create the 
proprietary subdirectory, and use adb (which will need to be in 
your path) to copy the files from your device.  You will need to
enable USB Debugging (under Settings/Applications/Development)
for this to work.

---- creating an update.zip after building ----

Run the following from the root of your Android directory.

TARGET_NO_RADIOIMAGE=true make otapackage

The resultant update.zip can then be found at:
out/target/product/$TARGET_PRODUCT/htc_magic-ota-eng.koush.zip