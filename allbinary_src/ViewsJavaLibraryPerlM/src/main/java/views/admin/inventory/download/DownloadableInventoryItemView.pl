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

package views::admin::inventory::download::DownloadableInventoryItemView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::logic::communication::http::request::RequestMapInterface';

our $TYPE_ID = 11;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{request} = undef;
    $self->{id} = undef;
    $self->{itemInterface} = undef;
    $self->{downloadableItem} = undef;
    $self->{requestHashMap} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of DownloadableInventoryItemView takes " . scalar(@arguments) . " arguments";
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
        return $views::admin::inventory::download::DownloadableInventoryItemView::TYPE_ID;
}


# throws Exception
sub getFormData {
    my ($self) = @_;
        $self->setRequestHashMap('org::allbinary::logic::communication::http::request::MultipartRequestParams'->new($self->{request})->toHashMap());
        $self->{id} = $self->getRequestHashMap()->get($self->{basicItemData}->{ID});
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        if (defined($self->{downloadableItem})) {
            $vector->add('org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemView'->new($self->{downloadableItem}));
        }
        $self->addDomNodeInterface('org::allbinary::business::user::commerce::inventory::item::BasicItemView'->new($self->{itemInterface}, $vector));
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            if ($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::download::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}


# throws Exception
sub processFile {
    my ($self, $fileItem) = @_;
        my $fileName = $fileItem->getName();
        my $fullPath = $self->getItemFilePath();
        my $itemResourceFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($fullPath);
        $itemResourceFile->mkdir();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($fullPath);
        $stringBuffer->append($fileName);
        $self->{logUtil}->putF("FileName: " . $fileName, $self, "processFile()");
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFile($stringBuffer->toString());
        $self->{logUtil}->putF($file->getPath(), $self, "processFiles()");
        $file->createNewFile();
        my $byteArray = $fileItem->get();
        'org::allbinary::logic::io::file::FileUtil'->getInstance()->write('java::io::ByteArrayInputStream'->new($byteArray), $file);
}


# throws Exception
sub unzip {
    my ($self, $fileItem) = @_;
        my $fileName = $fileItem->getName();
        my $fullPath = $self->getItemFilePath();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($fullPath);
        $stringBuffer->append($fileName);
        $self->{logUtil}->putF("FileName: " . $fileName, $self, "unzip()");
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFile($stringBuffer->toString());
        $self->{logUtil}->putF($file->getPath(), $self, "unzip()");
        'org::allbinary::logic::io::file::zip::ZipFileUtil'->getInstance()->unzip($fullPath, $file, $fileName);
}


sub getItemFilePath {
    my ($self) = @_;
        my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($self->getWeblisketSession()->getStoreName());
        my $filePathData = 'org::allbinary::logic::io::file::FilePathData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
        $stringBuffer->append($storeFrontInterface->getCurrentHostNamePath());
        $stringBuffer->append($self->{itemInterface}->getCategory());
        $stringBuffer->appendchar($filePathData->{SEPARATORCHAR});
        $stringBuffer->append($self->{itemInterface}->getId());
        $stringBuffer->appendchar($filePathData->{SEPARATORCHAR});
        $stringBuffer->append($self->{downloadableItem}->getId());
        $stringBuffer->appendchar($filePathData->{SEPARATORCHAR});
        return $stringBuffer->toString();
}


sub setRequestHashMap {
    my ($self, $requestHashMap) = @_;
        $self->{requestHashMap} = $requestHashMap;
}


sub getRequestHashMap {
    my ($self) = @_;
        return $self->{requestHashMap};
}


sub getDownloadableItem {
    my ($self) = @_;
        return $self->{downloadableItem};
}

# use java::io::ByteArrayInputStream;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::business::user::commerce::inventory::item::BasicItemView;
use org::allbinary::business::user::commerce::inventory::item::ItemInterface;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadableItem;
use org::allbinary::business::user::commerce::inventory::item::download::DownloadableItemView;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::MultipartRequestParams;
use org::allbinary::logic::communication::http::request::RequestMapInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FilePathData;
use org::allbinary::logic::io::file::FileUtil;
use org::allbinary::logic::io::file::zip::ZipFileUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::apache::commons::fileupload::FileItem;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

