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

package org::allbinary::business::backup::BlisketBackupFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::backup::BlisketBackupFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::backup::BlisketBackupFactory::instance;
}


# throws Exception
sub getFileBasicArrayList {
    my ($self, $pathString) = @_;
        my $path = 'org::allbinary::logic::io::path::AbPath'->new($pathString, $self->{stringUtil}->{EMPTY_STRING});
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($path);
        return $self->{directory}->search($file, 1);
}


sub backup {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "backup()");
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
            $stringBuffer->append('org::allbinary::globals::PATH_GLOBALS'->getInstance()->{BACKUP_PATH});
            my $backupPath = $stringBuffer->toString();
            my $path = 'org::allbinary::logic::io::path::AbPath'->new($backupPath, $self->{stringUtil}->{EMPTY_STRING});
            my $fileBasicArrayList = $self->getFileBasicArrayList($backupPath);
            $self->backup($fileBasicArrayList, $path->toFileSystemString() . "backup.zip");
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backup()", $e);
        }
}


sub backupViews {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "backupViews()");
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
            $stringBuffer->append('org::allbinary::globals::PATH_GLOBALS'->getInstance()->{BACKUP_PATH});
            my $backupPath = $stringBuffer->toString();
            my $path = 'org::allbinary::logic::io::path::AbPath'->new($backupPath, $self->{stringUtil}->{EMPTY_STRING});
            my $fileBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            my $storeFrontsEntity = 'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance();
            my $storeFrontNamesBasicArrayList = $storeFrontsEntity->getStoreFrontNames();
            my $size = $storeFrontNamesBasicArrayList->size();
            my $nextStore = undef;
            my $viewsPath = undef;
            for (my $index = 0; $index < $size; $index++) {
                $nextStore = $storeFrontNamesBasicArrayList->get($index);
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
                $stringBuffer->append('org::allbinary::globals::PATH_GLOBALS'->getInstance()->{VIEWS_PATH});
                $stringBuffer->append($nextStore);
                $viewsPath = $stringBuffer->toString();
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append("Backup Store Views: ");
                $stringBuffer->append($nextStore);
                $stringBuffer->append(" from: ");
                $stringBuffer->append($viewsPath);
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, "backupViews()");
                $fileBasicArrayList->addAllList($self->getFileBasicArrayList($viewsPath));
            }
            $self->backup($fileBasicArrayList, $path->toFileSystemString() . "backupViews.zip");
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backupViews()", $e);
        }
}


sub backupResources {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "backupResources()");
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
            $stringBuffer->append('org::allbinary::globals::PATH_GLOBALS'->getInstance()->{BACKUP_PATH});
            my $backupPath = $stringBuffer->toString();
            my $path = 'org::allbinary::logic::io::path::AbPath'->new($backupPath, $self->{stringUtil}->{EMPTY_STRING});
            my $fileBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            my $storeFrontsEntity = 'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance();
            my $storeFrontNamesBasicArrayList = $storeFrontsEntity->getStoreFrontNames();
            my $size = $storeFrontNamesBasicArrayList->size();
            my $nextStore = undef;
            my $storeFrontInterface = undef;
            my $resourcesPath = undef;
            for (my $index = 0; $index < $size; $index++) {
                $nextStore = $storeFrontNamesBasicArrayList->get($index);
                $storeFrontInterface = $storeFrontsEntity->getStoreFrontInterface($nextStore);
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
                $stringBuffer->append($storeFrontInterface->getCurrentHostNamePath());
                $stringBuffer->append($storeFrontInterface->getCategoryPath());
                $resourcesPath = $stringBuffer->toString();
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append("Backup Store Resrouces: ");
                $stringBuffer->append($nextStore);
                $stringBuffer->append(" from: ");
                $stringBuffer->append($resourcesPath);
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, "backupResources()");
                $fileBasicArrayList->addAllList($self->getFileBasicArrayList($resourcesPath));
            }
            $self->backup($fileBasicArrayList, $path->toFileSystemString() . "backupResources.zip");
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backupResources()", $e);
        }
}


sub backupJsps {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "backupJsps()");
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
            $stringBuffer->append('org::allbinary::globals::PATH_GLOBALS'->getInstance()->{BACKUP_PATH});
            my $backupPath = $stringBuffer->toString();
            my $path = 'org::allbinary::logic::io::path::AbPath'->new($backupPath, $self->{stringUtil}->{EMPTY_STRING});
            my $fileBasicArrayList = 'org::allbinary::util::BasicArrayListD'->new();
            my $storeFrontsEntity = 'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance();
            my $storeFrontNamesBasicArrayList = $storeFrontsEntity->getStoreFrontNames();
            my $size = $storeFrontNamesBasicArrayList->size();
            my $nextStore = undef;
            for (my $index = 0; $index < $size; $index++) {
                $nextStore = $storeFrontNamesBasicArrayList->get($index);
                'org::allbinary::logic::communication::log::PreLogUtil'->put("Backup Store Jsps: " . $nextStore, $self, "backupJsps()");
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
                $stringBuffer->append($nextStore);
                $fileBasicArrayList->addAllList($self->getFileBasicArrayList($stringBuffer->toString()));
            }
            $self->backup($fileBasicArrayList, $path->toFileSystemString() . "backupJsps.zip");
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backupJsps()", $e);
        }
}


# Java overloaded method: Perl keeps the last definition
sub backup {
    my ($self, $fileBasicArrayList, $zipFile) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append("ZipFile: ");
            $stringBuffer->append($zipFile);
            $stringBuffer->append(" BasicArrayList: ");
            $stringBuffer->appendint($fileBasicArrayList->size());
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Creating Backup Zip File: " . $stringBuffer->toString(), $self, "backup()");
            'org::allbinary::logic::io::file::zip::ZipFileUtil'->getInstance()->create($zipFile, $fileBasicArrayList);
            $self->{logUtil}->putF("Created Backup Zip File", $self, "backup()");
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "backup()", $e);
        }
}

use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntity;
use org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory;
use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::file::zip::ZipFileUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

