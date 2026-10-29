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

package views::admin::inventory::AddFileValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::inventory::InventoryItemView','org::allbinary::logic::control::validate::ValidationComponentInterface';

our $ADDPRODUCT = "Add Product";
our $NEXTSTEP = 'org::allbinary::string::CommonLabels'->getInstance()->{NEXT} . " Step";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
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
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($command) || (($command cmp $views::admin::inventory::AddFileValidationView::ADDPRODUCT) != 0 && ($command cmp $NEXTSTEP) != 0)) {
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("Invalid AdminCommand: ");
                    $stringBuffer->append($command);
                    $stringBuffer->append(" must be: ");
                    $stringBuffer->append($views::admin::inventory::AddFileValidationView::ADDPRODUCT);
                    $stringBuffer->append(" or ");
                    $stringBuffer->append($views::admin::inventory::AddFileValidationView::NEXTSTEP);
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            my $basicItemValidation = 'org::allbinary::business::user::commerce::inventory::item::BasicItemValidation'->new($self->{itemInterface});
            if ($basicItemValidation->isValid() == 0) {
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF($basicItemValidation->validationInfo(), $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getWeblisketSession()->getStoreName());
            $self->{itemInterface}->setCategory($storeFrontInterface->getCategoryPath() + $self->{itemInterface}->getCategory());
            my $fullCategory = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::globals::URLGLOBALS'->getWebappPath())->append($storeFrontInterface->getCurrentHostNamePath())->append($self->{itemInterface}->getCategory())->toString();
            my $categoryFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($fullCategory);
            if (!$categoryFile->isDirectory()) {
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Category Does Not Exist: " . $fullCategory, $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            if (defined('org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance()->getItem($self->{itemInterface}->getId()))) {
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Item Already Exists", $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            my $imageFileItemObject = $self->getRequestHashMap()->get($self->{basicItemData}->{IMAGE});
            if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($imageFileItemObject)) {
                my $fileItem = $imageFileItemObject;
                my $fileName = $fileItem->getName();
                my $size = $fileItem->getSize();
                'org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->log($fileItem);
                if ($self->isValid($fileName, $size) == 0) {
                    return 0;
                }
            }
            return 1;
        } catch ($e) {
            if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($command) || (($command cmp $views::admin::inventory::AddFileValidationView::ADDPRODUCT) != 0 && ($command cmp $NEXTSTEP) != 0)) {
                return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            }
            my $basicItemValidation = 'org::allbinary::business::user::commerce::inventory::item::BasicItemValidation'->new($self->{itemInterface});
            if ($basicItemValidation->isValid() == 0) {
                $stringBuffer->append($basicItemValidation->validationInfo());
                $stringBuffer->append("<br/>");
            }
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getWeblisketSession()->getStoreName());
            my $fullCategory = 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::globals::URLGLOBALS'->getWebappPath())->append($storeFrontInterface->getCurrentHostNamePath())->append($self->{itemInterface}->getCategory())->toString();
            if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Category: " . $fullCategory, $self, "validationInfo()");
            }
            my $categoryFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($fullCategory);
            if (!$categoryFile->isDirectory()) {
                $stringBuffer->append("Category ");
                $stringBuffer->append($self->{itemInterface}->getCategory());
                $stringBuffer->append(" does not exist.<br />");
            }
            try {
                if (defined('org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory'->getInstance()->getInventoryEntityInstance()->getItem($self->{itemInterface}->getId()))) {
                    $stringBuffer->append("Id is already in use. Refresh the page for a valid id.<br/>");
                }
            } catch ($e) {
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Existing Item With MoneyException", $self, "validationInfo()");
                }
            }
            my $anyType = $self->getRequestHashMap()->get($self->{basicItemData}->{IMAGE});
            if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($anyType)) {
                my $fileItem = $anyType;
                my $fileName = $fileItem->getName();
                my $fileItemFieldName = $fileItem->getFieldName();
                my $size = $fileItem->getSize();
                $self->validationInfo($stringBuffer, $fileName, $fileItemFieldName, $size);
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
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
        if ($size > $fileData->{MINIMAGEFILESIZE}) {
            if ($size < $fileData->{MAXIMAGEFILESIZE}) {
                if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($fileName, $fileData->{MINLEN}, $fileData->{MAXLEN})) {
                    return 0;
                } else {
                    my $pathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
                    my $extension = $pathData->getExtension($fileName);
                    my $uploadMedia = 'org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton'->getInstance();
                    if (!$uploadMedia->isWriterSupported($extension) && !$uploadMedia->isReaderSupported($extension)) {
                        return 0;
                    }
                }
            } else {
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("File Size To Large: ");
                    $stringBuffer->appendlong($size);
                    $stringBuffer->append(">");
                    $stringBuffer->appendint(int($fileData->{MAXIMAGEFILESIZE}));
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                }
                return 0;
            }
            $self->processImageFiles();
        } else {
            if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("File Size To Small: ");
                $stringBuffer->appendlong($size);
                $stringBuffer->append(">");
                $stringBuffer->appendint(int($fileData->{MINIMAGEFILESIZE}));
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
            }
            return 0;
        }
        return 1;
}


# Java overloaded method: Perl keeps the last definition
sub validationInfo {
    my ($self, $stringBuffer, $fileName, $fileItemFieldName, $size) = @_;
        my $fileData = 'org::allbinary::logic::io::file::FileData'->getInstance();
        if ($size > $fileData->{MINIMAGEFILESIZE}) {
            if (($fileItemFieldName cmp $self->{basicItemData}->{IMAGE}) == 0) {
                if ($size < $fileData->{MAXIMAGEFILESIZE}) {
                    if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isValidRequired($fileName, $fileData->{MINLEN}, $fileData->{MAXLEN})) {
                        $stringBuffer->append("FileName must be >");
                        $stringBuffer->appendint(int($fileData->{MINLEN}));
                        $stringBuffer->append(" and <");
                        $stringBuffer->appendint(int($fileData->{MAXLEN}));
                        $stringBuffer->append("<br/>");
                    } else {
                        my $pathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
                        my $extension = $pathData->getExtension($fileName);
                        my $uploadMedia = 'org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton'->getInstance();
                        if (!$uploadMedia->isWriterSupported($extension) && !$uploadMedia->isReaderSupported($extension)) {
                            $stringBuffer->append("Image type: ");
                            $stringBuffer->append($extension);
                            $stringBuffer->append(" not supported.<br />");
                        }
                    }
                } else {
                    $stringBuffer->append("Image File Is To Large. ");
                    $stringBuffer->appendint(int($fileData->{MINIMAGEFILESIZE}));
                    $stringBuffer->append(" < > ");
                    $stringBuffer->appendint(int($fileData->{MAXIMAGEFILESIZE}));
                    $stringBuffer->append("<br/>");
                }
            }
        } else {
            $stringBuffer->append("Image File Is To Small. ");
            $stringBuffer->appendint(int($fileData->{MINIMAGEFILESIZE}));
            $stringBuffer->append(" < > ");
            $stringBuffer->appendint(int($fileData->{MAXIMAGEFILESIZE}));
            $stringBuffer->append("<br/>");
        }
}

use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemValidation;
use org::allbinary::business::user::commerce::money::MoneyException;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntityFactory;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil;
use org::allbinary::logic::communication::http::file::upload::media::UploadMediaSingleton;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FileData;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonLabels;
use org::apache::commons::fileupload::FileItem;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::admin::inventory::InventoryItemView;

1;

