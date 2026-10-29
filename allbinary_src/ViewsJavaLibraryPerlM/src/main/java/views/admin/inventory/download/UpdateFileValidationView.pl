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

package views::admin::inventory::download::UpdateFileValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::inventory::download::DownloadableInventoryItemView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            my $command = $self->getRequestHashMap()->get($org::allbinary::globals::GLOBALS2::ADMINCOMMAND);
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($command) || ($command cmp $self->{commonStrings}->{UPDATE}) != 0) {
                if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Invalid AdminCommand=" . $command, $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            try {
                my $inventoryEntity = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance();
                $self->{itemInterface} = $inventoryEntity->getItem($self->{id});
            } catch ($e) {
                if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->put("Existing Item With MoneyException", $self, $self->{commonStrings}->{IS_VALID}, $e);
                }
            }
            if (!defined($self->{itemInterface})) {
                if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Item Does Not Exist", $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            if ('org::allbinary::business::user::commerce::inventory::item::BasicItemValidation'->new($self->{itemInterface})->isValid() == 0) {
                if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("BasicItem is not valid", $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getWeblisketSession()->getStoreName());
            my $fullCategory = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::globals::URLGLOBALS'->getWebappPath())->append($storeFrontInterface->getCurrentHostNamePath())->append($self->{itemInterface}->getCategory())->toString();
            my $categoryFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($fullCategory);
            if (!$categoryFile->isDirectory()) {
                if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Category Does Not Exist: " . $fullCategory, $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            my $downloadableFileObject = $self->getRequestHashMap()->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE);
            if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($downloadableFileObject)) {
                my $fileItem = $downloadableFileObject;
                my $fileName = $fileItem->getName();
                my $size = $fileItem->getSize();
                'org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->log($fileItem);
                if ($self->isValid($fileName, $size) == 0) {
                    return 0;
                } else {
                    $self->processFile($fileItem);
                    $self->getRequestHashMap()->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::SIZE, ("" . ($size)));
                }
            } else {
                $self->getRequestHashMap()->remove($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE);
            }
            my $licenseFileObject = $self->getRequestHashMap()->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE);
            if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($licenseFileObject)) {
                my $fileItem = $licenseFileObject;
                my $fileName = $fileItem->getName();
                my $size = $fileItem->getSize();
                'org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->log($fileItem);
                if ($self->isValid($fileName, $size) == 0) {
                } else {
                    $self->processFile($fileItem);
                }
            } else {
                $self->getRequestHashMap()->remove($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE);
            }
            my $extraFilesObject = $self->getRequestHashMap()->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::EXTRA_FILES);
            if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($extraFilesObject)) {
                my $fileItem = $extraFilesObject;
                my $fileName = $fileItem->getName();
                my $size = $fileItem->getSize();
                'org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->log($fileItem);
                if ($self->isValid($fileName, $size) == 0) {
                } else {
                    $self->processFile($fileItem);
                    $self->unzip($fileItem);
                }
            } else {
                $self->getRequestHashMap()->remove($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::EXTRA_FILES);
            }
            my $hashMap = $self->getRequestHashMap();
            $hashMap->put($self->{basicItemData}->{ID}, $self->{itemInterface}->getId());
            my $licenseObject = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE);
            if (defined($licenseObject)) {
                $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE, ($licenseObject)->getName());
            } else {
                $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            }
            my $fileObject = $hashMap->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE);
            if (defined($fileObject)) {
                $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE, ($fileObject)->getName());
            } else {
                $hashMap->put($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            }
            $self->{downloadableItem} = 'org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem'->new($hashMap);
            my $downloadableItemValidation = 'org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemValidation'->new($self->{downloadableItem});
            if ($downloadableItemValidation->isValid() == 0) {
                if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("DownloadableItem is not valid", $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            return 1;
        } catch ($e) {
            if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Exception in validation", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $command = $self->getRequestHashMap()->get($org::allbinary::globals::GLOBALS2::ADMINCOMMAND);
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($command) || ($command cmp $self->{commonStrings}->{UPDATE}) != 0) {
                return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            }
            if (!defined($self->{itemInterface})) {
                my $ITEM_NOT_FOUND = "Item Does Not Exist";
                if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF($ITEM_NOT_FOUND, $self, "validationInfo()");
                }
                return $ITEM_NOT_FOUND;
            }
            my $basicItemValidation = 'org::allbinary::business::user::commerce::inventory::item::BasicItemValidation'->new($self->{itemInterface});
            if ($basicItemValidation->isValid() == 0) {
                $stringBuffer->append($basicItemValidation->validationInfo());
                $stringBuffer->append("<br/>");
            }
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getWeblisketSession()->getStoreName());
            my $fullCategory = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::globals::URLGLOBALS'->getWebappPath())->append($storeFrontInterface->getCurrentHostNamePath())->append($self->{itemInterface}->getCategory())->toString();
            if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Category: " . $fullCategory, $self, "validationInfo()");
            }
            my $categoryFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($fullCategory);
            if (!$categoryFile->isDirectory()) {
                $stringBuffer->append("Category ");
                $stringBuffer->append($self->{itemInterface}->getCategory());
                $stringBuffer->append(" does not exist.");
                $stringBuffer->append("<br />");
            }
            my $downloadableFileObject = $self->getRequestHashMap()->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::FILE);
            if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($downloadableFileObject)) {
                my $fileItem = $downloadableFileObject;
                my $fileName = $fileItem->getName();
                my $size = $fileItem->getSize();
                $self->validationInfo($stringBuffer, $fileName, $size);
            } else {
                $stringBuffer->append("Download File Missing");
                $stringBuffer->append("<br/>");
            }
            my $licenseFileObject = $self->getRequestHashMap()->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::LICENSE_FILE);
            if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($licenseFileObject)) {
                my $fileItem = $licenseFileObject;
                my $fileName = $fileItem->getName();
                my $size = $fileItem->getSize();
                $self->validationInfo($stringBuffer, $fileName, $size);
            } else {
            }
            my $extraFilesObject = $self->getRequestHashMap()->get($org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData::EXTRA_FILES);
            if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($extraFilesObject)) {
                my $fileItem = $extraFilesObject;
                my $fileName = $fileItem->getName();
                my $size = $fileItem->getSize();
                $self->validationInfo($stringBuffer, $fileName, $size);
            } else {
            }
            if (defined($self->{downloadableItem})) {
                my $downloadableItemValidation = 'org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemValidation'->new($self->{downloadableItem});
                if ($downloadableItemValidation->isValid() == 0) {
                    my $log = $downloadableItemValidation->validationInfo();
                    if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                        $self->{logUtil}->putF($log, $self, $self->{commonStrings}->{IS_VALID});
                    }
                    $stringBuffer->append($log);
                    $stringBuffer->append("<br/>");
                }
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Getting Validation Info";
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub isValid {
    my ($self, $fileName, $size) = @_;
        my $fileData = 'org::allbinary::logic::io::file::FileData'->getInstance();
        if ($size > $fileData->{MINDOWNLOADABLEFILESIZE}) {
            if ($size < $fileData->{MAXDOWNLOADABLEFILESIZE}) {
                if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($fileName, $fileData->{MINLEN}, $fileData->{MAXLEN})) {
                    if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append("File name is not valid: ");
                        $stringBuffer->append($fileName);
                        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                    }
                    return 0;
                } else {
                }
            } else {
                if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("File Size To Large: ");
                    $stringBuffer->appendlong($size);
                    $stringBuffer->append(">");
                    $stringBuffer->appendint(int($fileData->{MAXDOWNLOADABLEFILESIZE}));
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
        } else {
            if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("File Size To Small: ");
                $stringBuffer->appendlong($size);
                $stringBuffer->append(">");
                $stringBuffer->appendint(int($fileData->{MINDOWNLOADABLEFILESIZE}));
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
            }
            return 0;
        }
        return 1;
}


# Java overloaded method: Perl keeps the last definition
sub validationInfo {
    my ($self, $stringBuffer, $fileName, $size) = @_;
        my $fileData = 'org::allbinary::logic::io::file::FileData'->getInstance();
        if ($size > $fileData->{MINDOWNLOADABLEFILESIZE}) {
            if ($size < $fileData->{MAXDOWNLOADABLEFILESIZE}) {
                if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($fileName, $fileData->{MINLEN}, $fileData->{MAXLEN})) {
                    $stringBuffer->append("File Name must be more than ");
                    $stringBuffer->appendint(int($fileData->{MINLEN}));
                    $stringBuffer->append(" and less than ");
                    $stringBuffer->appendint(int($fileData->{MAXLEN}));
                    $stringBuffer->append(" characters in length: ");
                    $stringBuffer->append($fileName);
                    $stringBuffer->append("<br/>");
                } else {
                }
            } else {
                $stringBuffer->append("File Is Not The Right Size. ");
                $stringBuffer->appendint(int($fileData->{MINDOWNLOADABLEFILESIZE}));
                $stringBuffer->append("< >");
                $stringBuffer->appendint(int($fileData->{MAXDOWNLOADABLEFILESIZE}));
                $stringBuffer->append("<br/>");
            }
        }
}

use java::util::HashMap;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemValidation;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadItemData;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemValidation;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonStrings;
use org::apache::commons::fileupload::FileItem;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::admin::inventory::download::DownloadableInventoryItemView;

1;

