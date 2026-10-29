#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package views::admin::inventory::InventoryUploadMediaUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{mediaUtil} = 'org::allbinary::logic::visual::media::MediaUtil'->getInstance();
    $self->{LARGEWIDTH} = 1024;
    $self->{LARGEHEIGHT} = 1024;
    $self->{MEDIUMWIDTH} = 256;
    $self->{MEDIUMHEIGHT} = 256;
    $self->{SMALLWIDTH} = 128;
    $self->{SMALLHEIGHT} = 128;
    $self->{SMALL} = "Small";
    $self->{MEDIUM} = "Medium";
    $self->{LARGE} = "Large";
    $self->{storeFrontInterface} = undef;
    $self->{itemInterface} = undef;
}


sub new {
    my ($class, $storeFrontInterface, $itemInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{storeFrontInterface} = $storeFrontInterface;
        $self->{itemInterface} = $itemInterface;
    return $self;
}


# throws Exception
sub saveFiles {
    my ($self, $byteArray, $fileName, $mediaData) = @_;
        if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF("Start FileName: " . $fileName, $self, "saveFiles()");
        }
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($fileName)) {
            die ("Image File Name Was Null");
        }
        my $fileUtil = 'org::allbinary::logic::io::file::FileUtil'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
        $stringBuffer->append($self->{storeFrontInterface}->getCurrentHostNamePath());
        $stringBuffer->append($self->{itemInterface}->getCategory());
        my $fullPath = $stringBuffer->toString();
        my $imageDirectoryFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($fullPath);
        if (!$imageDirectoryFile->isDirectory()) {
            die ("Unable to save file to non existant directory");
        }
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($fullPath);
        $stringBuffer->append($fileName);
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
        $stringBuffer->append($mediaData->getName());
        my $originalImageFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($stringBuffer->toString());
        if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF("Saving Original Image: " . $originalImageFile, $self, "saveFiles()");
        }
        $originalImageFile->createNewFile();
        $fileUtil->write('java::io::ByteArrayInputStream'->new($byteArray), $originalImageFile);
        my $uploadMedia = 'org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton'->getInstance();
        my $isMediaSupported = $uploadMedia->isWriterSupported($mediaData->getName()) || $uploadMedia->isReaderSupported($mediaData->getName());
        if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append("Is Image Type: ");
            $stringBuffer->append($mediaData->getName());
            $stringBuffer->append(" supported: ");
            $stringBuffer->appendboolean($isMediaSupported);
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "saveFiles()");
        }
        my $defaultMediaData = 'org::allbinary::logic::visual::media::MediaData'->getDefault();
        $self->setFileNames($fileName);
        if ($isMediaSupported) {
            my $isMediaResizable = $uploadMedia->isWriterMedia($mediaData->getName(), 'org::allbinary::logic::visual::media::MediaTypeData'->getInstance()->{RESIZABLE_MEDIA});
            if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append("Is ");
                $stringBuffer->append($mediaData->toString());
                $stringBuffer->append(" Image Resize Supported:");
                $stringBuffer->appendboolean($uploadMedia->isSupported($mediaData->getName()));
                $stringBuffer->append(" WriterMedia: ");
                $stringBuffer->appendboolean($isMediaResizable);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "saveFiles()");
            }
            if ($isMediaResizable) {
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                    $self->{logUtil}->putF("Saving Small Image: " . $self->{itemInterface}->getSmallImage(), $self, "saveFiles()");
                }
                $self->{mediaUtil}->saveImageFile($originalImageFile, $self->{itemInterface}->getSmallImage(), $fullPath, $mediaData, $self->{SMALLWIDTH}, $self->{SMALLHEIGHT});
                $self->{mediaUtil}->saveImageFile($originalImageFile, $self->{itemInterface}->getMediumImage(), $fullPath, $mediaData, $self->{MEDIUMWIDTH}, $self->{MEDIUMHEIGHT});
                $self->{mediaUtil}->saveImageFile($originalImageFile, $self->{itemInterface}->getLargeImage(), $fullPath, $mediaData, $self->{LARGEWIDTH}, $self->{LARGEHEIGHT});
            } else {
                my $isConvertable = $mediaData->isConvertableTo($defaultMediaData);
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append("Converting: ");
                    $stringBuffer->append($defaultMediaData->getName());
                    $stringBuffer->append(" into ");
                    $stringBuffer->append($mediaData->getName());
                    $stringBuffer->append(" if Convertable is it: ");
                    $stringBuffer->appendboolean($isConvertable);
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "saveFiles()");
                }
                if ($isConvertable) {
                    if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
                        $self->{logUtil}->putF("Saving Small Image: " . $self->{itemInterface}->getSmallImage(), $self, "saveFiles()");
                    }
                    $self->{mediaUtil}->saveImageFile($originalImageFile, $self->{itemInterface}->getSmallImage(), $fullPath, $defaultMediaData, $self->{SMALLWIDTH}, $self->{SMALLHEIGHT});
                    $self->{mediaUtil}->saveImageFile($originalImageFile, $self->{itemInterface}->getMediumImage(), $fullPath, $defaultMediaData, $self->{MEDIUMWIDTH}, $self->{MEDIUMHEIGHT});
                    $self->{mediaUtil}->saveImageFile($originalImageFile, $self->{itemInterface}->getLargeImage(), $fullPath, $defaultMediaData, $self->{LARGEWIDTH}, $self->{LARGEHEIGHT});
                } else {
                    my $smallImageFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($self->{itemInterface}->getSmallImage());
                    $smallImageFile->createNewFile();
                    $fileUtil->write('java::io::ByteArrayInputStream'->new($byteArray), $smallImageFile);
                    my $mediumImageFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($self->{itemInterface}->getMediumImage());
                    $smallImageFile->createNewFile();
                    $fileUtil->write('java::io::ByteArrayInputStream'->new($byteArray), $mediumImageFile);
                    my $largeImageFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($self->{itemInterface}->getSmallImage());
                    $largeImageFile->createNewFile();
                    $fileUtil->write('java::io::ByteArrayInputStream'->new($byteArray), $largeImageFile);
                }
            }
        }
        if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{END}, $self, "saveFiles()");
        }
        return $self->{itemInterface};
}


sub setFileNames {
    my ($self, $fileName) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{itemInterface}->getId());
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
        $stringBuffer->append('org::allbinary::logic::visual::media::MediaData'->getDefault()->getName());
        my $END = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($fileName);
        $stringBuffer->append($self->{SMALL});
        $stringBuffer->append($END);
        my $newImageFileName = $stringBuffer->toString();
        $self->{itemInterface}->setSmallImage($newImageFileName);
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($fileName);
        $stringBuffer->append($self->{MEDIUM});
        $stringBuffer->append($END);
        $newImageFileName = $stringBuffer->toString();
        $self->{itemInterface}->setMediumImage($newImageFileName);
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($fileName);
        $stringBuffer->append($self->{LARGE});
        $stringBuffer->append($END);
        $newImageFileName = $stringBuffer->toString();
        $self->{itemInterface}->setLargeImage($newImageFileName);
}

# use java::io::ByteArrayInputStream;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::media::MediaData;
use org::allbinary::logic::visual::media::MediaTypeData;
use org::allbinary::logic::visual::media::MediaUtil;
use org::allbinary::string::CommonStrings;

1;

