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

package views::admin::inventory::InventoryItemView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::logic::communication::http::request::RequestMapInterface';

our $TYPE_ID = 10;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{request} = undef;
    $self->{imageFileName} = undef;
    $self->{mediaData} = undef;
    $self->{itemInterface} = undef;
    $self->{downloadableItemVector} = undef;
    $self->{requestHashMap} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of InventoryItemView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{request} = $self->getPageContext()->getRequest();
        $self->getFormData();
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $empty) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{request} = $self->getPageContext()->getRequest();
    return $self;
}


sub getTypeId {
    my ($self) = @_;
        return $views::admin::inventory::InventoryItemView::TYPE_ID;
}


# throws Exception
sub getFormData {
    my ($self) = @_;
        $self->setRequestHashMap('org::allbinary::logic::communication::http::request::MultipartRequestParams'->new($self->{request})->toHashMap());
        my $imageFileItemObject = $self->getRequestHashMap()->get($self->{basicItemData}->{IMAGE});
        if ('org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil'->getInstance()->isValid($imageFileItemObject)) {
            my $fileItem = $imageFileItemObject;
            if (defined($fileItem) && $fileItem->getSize() > 1) {
                $self->{imageFileName} = 'org::allbinary::logic::communication::http::request::HttpRequestUtil'->getInstance()->generateFileName($fileItem->getName());
                my $pathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
                my $pathUtil = 'org::allbinary::logic::io::path::PathUtil'->getInstance();
                $self->{mediaData} = 'org::allbinary::logic::visual::media::MediaData'->get($pathData->getExtension($self->{imageFileName}));
                $self->{imageFileName} = $pathUtil->getWithoutExtension($self->{imageFileName});
                if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("Uploaded File Data: ");
                    $stringBuffer->append($self->{imageFileName});
                    $stringBuffer->append(" Extension: ");
                    $stringBuffer->append($self->{mediaData}->getName());
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "getFormData()");
                }
            }
        }
        $self->{itemInterface} = 'org::allbinary::business::user::commerce::inventory::item::BasicItem'->new($self->getRequestHashMap());
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        my $downloadableItem = undef;
        my $size = $self->{downloadableItemVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            $downloadableItem = $self->{downloadableItemVector}->get($index);
            $vector->add('org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemView'->new($downloadableItem));
        }
        $self->addDomNodeInterface('org::allbinary::business::user::commerce::inventory::item::BasicItemView'->new($self->{itemInterface}, $vector));
}


sub getItemInterface {
    my ($self) = @_;
        return $self->{itemInterface};
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            if ($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}


# throws Exception
sub processImageFiles {
    my ($self) = @_;
        my $set = $self->getRequestHashMap()->keySet();
        my $fieldNameArray = $set->toArray();
        my $size = scalar(@{$fieldNameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $fieldName = $fieldNameArray->[$index];
            if (($fieldName cmp $self->{basicItemData}->{IMAGE}) == 0) {
                my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getWeblisketSession()->getStoreName());
                my $inventoryUploadMediaUtil = 'views::admin::inventory::InventoryUploadMediaUtil'->new($storeFrontInterface, $self->{itemInterface});
                my $fileItem = $self->getRequestHashMap()->get($self->{basicItemData}->{IMAGE});
                $self->{itemInterface} = $inventoryUploadMediaUtil->saveFiles($fileItem->get(), $self->{imageFileName}, $self->{mediaData});
            }
        }
}


sub setRequestHashMap {
    my ($self, $requestHashMap) = @_;
        $self->{requestHashMap} = $requestHashMap;
}


sub getRequestHashMap {
    my ($self) = @_;
        return $self->{requestHashMap};
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::item::BasicItem;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemView;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemView;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::file::upload::HttpFileUploadUtil;
use org::allbinary::logic::communication::http::request::HttpRequestUtil;
use org::allbinary::logic::communication::http::request::MultipartRequestParams;
use org::allbinary::logic::communication::http::request::RequestMapInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::io::path::PathUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::media::MediaData;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::apache::commons::fileupload::FileItem;
use views::business::context::modules::storefront::HttpStoreComponentView;
use views::admin::inventory::InventoryUploadMediaUtil;

1;

