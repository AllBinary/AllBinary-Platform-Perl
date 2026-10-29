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

package views::admin::inventory::listings::ProductListing;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::admin::inventory::listings::ProductListingInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
    $self->{basicItemData} = 'org::allbinary::business::user::commerce::inventory::item::BasicItemData'->getInstance();
    $self->{storeFronts} = undef;
    $self->{staticPages} = undef;
    $self->{inventory} = undef;
    $self->{searchRequest} = undef;
    $self->{INVENTORY} = ".InventoryView";
}


sub new {
    my ($class, $searchRequest) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{searchRequest} = $searchRequest;
        $self->{storeFronts} = 'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntity'->new();
        $self->{staticPages} = 'org::allbinary::data::tables::staticpages::StaticPagesEntity'->new();
        $self->{inventory} = 'org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity'->new();
    return $self;
}


# throws Exception
sub getHashSet {
    my ($self, $storeFront) = @_;
        my $inventoryColumnUtil = 'views::generic::inventory::InventoryColumnUtil'->getInstance();
        my $keywords = $inventoryColumnUtil->getColumnWhereLike($self->{inventory}, $storeFront->getCategoryPath(), $self->{basicItemData}->{KEYWORDS});
        my $subStoreVector = $storeFront->getSubStores();
        my $size = $subStoreVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $subStore = $subStoreVector->get($index);
            my $substoreKeywords = $inventoryColumnUtil->getColumnWhereLike($self->{inventory}, 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR} . $subStore, $self->{basicItemData}->{CATEGORY});
            $keywords->addAllList($substoreKeywords);
        }
        my $uniqueTokens = 'org::allbinary::logic::string::tokens::UniqueTokens'->new();
        my $keywordHashSet = $uniqueTokens->getWhithoutDashesAndSkipNumberOnlyTokens($keywords);
        return $keywordHashSet;
}


# throws Exception
sub savePage {
    my ($self, $file, $data) = @_;
        if ($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{STATICPAGEGENERATIONLOGGING})) {
            $self->{logUtil}->putF("Creating File: " . $file, $self, "generateAll()");
        }
        my $newFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($file);
        if ($newFile->exists()) {
            $newFile->delete();
        }
        $newFile->createNewFile();
        if ($newFile->exists()) {
            my $idOutData = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($newFile);
            $idOutData->writeBytes($data);
            $idOutData->flush();
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($idOutData);
            if ($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{STATICPAGEGENERATIONLOGGING})) {
                $self->{logUtil}->putF("Wrote Total Bytes: " . $newFile->length(), $self, "generateAll()");
            }
        } else {
            die ("Could Not Create: " . $file);
        }
}


# throws Exception
sub create {
    my ($self, $keywordData, $keywordFilenameHashMap, $vector, $staticPath) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $hashMap = 'org::allbinary::logic::string::SpecialCharacterUtil'->getHashMap();
        $hashMap->put('org::allbinary::string::CommonSeps'->getInstance()->{SPACE}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        my $pageName = 'org::allbinary::logic::string::regex::replace::Replace'->new($hashMap)->all($keywordData);
        my $searchParams = $self->{searchRequest}->getParams();
        $searchParams->add($self->{basicItemData}->{KEYWORDS}, $keywordData);
        $searchParams->setStartPage('org::allbinary::string::CommonPhoneStrings'->getInstance()->{ZERO});
        $self->{searchRequest}->setParams($searchParams);
        $self->{searchRequest}->setFileBaseName($pageName);
        my $abeClientInformation = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
        my $inventorySearchUtil = 'views::generic::inventory::InventorySearchUtil'->getInstance();
        my $productListingPages = $inventorySearchUtil->search($abeClientInformation, $self->{searchRequest}, $vector);
        for (my $index = 0; $index < scalar(@{$productListingPages}); $index++) {
            if (!defined($productListingPages->[$index])) {
                last;
            }
            if ($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{STATICPAGEGENERATIONLOGGING})) {
                $self->{logUtil}->putF("Saving Listing: " . $index, $self, "generateAll()");
            }
            my $indexStr = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
            if ($index > 0) {
                $indexStr = $index->toString();
            }
            $keywordFilenameHashMap->put($keywordData, $pageName . $indexStr);
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($staticPath->toString());
            $stringBuffer->append($pageName);
            $stringBuffer->append($indexStr);
            $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{EXTENSION_SEP});
            $stringBuffer->append('org::allbinary::logic::io::InputOutputTypeData'->getInstance()->{DEFAULT});
            my $file = $stringBuffer->toString();
            if (!$self->{directory}->create($staticPath)) {
                die ("Could Not Create Directory: " . $staticPath);
            }
            $self->savePage($file, $productListingPages->[$index]);
        }
}


sub addStaticPageInfoToDatabase {
    my ($self, $storeFront, $keywordFilenameHashMap) = @_;
        my $keywordHashSet = $keywordFilenameHashMap->keySet();
        my $keywordArray = $keywordHashSet->toArray();
        my $size = scalar(@{$keywordArray});
        for (my $index = 0; $index < $size; $index++) {
            my $insertVector = 'org::allbinary::util::BasicArrayListD'->new();
            my $keywordData = $keywordArray->[$index];
            my $fileName = $keywordFilenameHashMap->get($keywordData);
            $insertVector->add($storeFront->getName());
            $insertVector->add($keywordData);
            $insertVector->add($fileName);
            $self->{staticPages}->insert($insertVector);
        }
}


# throws Exception
sub generateAll {
    my ($self) = @_;
        try {
            my $storeFront = $self->{searchRequest}->getStoreFront();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
            $stringBuffer->append($storeFront->getName());
            $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
            $stringBuffer->append($storeFront->getStaticPath());
            my $staticPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
            if ($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::inventory::listings::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{STATICPAGEGENERATIONLOGGING})) {
                $self->{logUtil}->putF("Store Static Pages Path: " . $staticPath, $self, "generateAll()");
            }
            my $keywordHashSet = $self->getHashSet($storeFront);
            my $keywordArray = $keywordHashSet->toArray();
            my $size = scalar(@{$keywordArray});
            my $keywordFilenameHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            if ($size == 0) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append("Products For ");
                $stringBuffer->append($storeFront->getName());
                $stringBuffer->append(" Store Not Found");
                return $stringBuffer->toString();
            }
            my $inventorySearchUtil = 'views::generic::inventory::InventorySearchUtil'->getInstance();
            my $vector = $inventorySearchUtil->getBasicItemIdColumn($self->{searchRequest});
            for (my $index = 0; $index < $size; $index++) {
                my $keywordData = $keywordArray->[$index];
                if (length($keywordData) > 1) {
                    $self->create($keywordData, $keywordFilenameHashMap, $vector, $staticPath);
                }
            }
            $self->addStaticPageInfoToDatabase($storeFront, $keywordFilenameHashMap);
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append("Static Files Generated Successfully For ");
            $stringBuffer->append($storeFront->getName());
            $stringBuffer->append(" it used packages ");
            $stringBuffer->append($storeFront->getPackageLocation());
            $stringBuffer->append($self->{INVENTORY});
            return $stringBuffer->toString();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub generateAll {
    my ($self, $storeName) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (defined($storeName)) {
                if (($storeName cmp $org::allbinary::globals::GLOBALS2::GENERATEALLSTORES) != 0) {
                    $self->{searchRequest}->setStoreFront($self->{storeFronts}->getStoreFrontInterface($storeName));
                    $stringBuffer->append($self->generateAll());
                    $stringBuffer->append("<br />");
                } else {
                    my $storeFrontVector = $self->{storeFronts}->getStoreFrontNames();
                    my $size = $storeFrontVector->size();
                    for (my $index = 0; $index < $size; $index++) {
                        $storeName = $storeFrontVector->get($index);
                        $self->{searchRequest}->setStoreFront($self->{storeFronts}->getStoreFrontInterface($storeName));
                        $stringBuffer->append($self->generateAll());
                        $stringBuffer->append("<br />");
                    }
                }
            } else {
                return "Generation Failed No Store Specified<br/>";
            }
            $stringBuffer->append("All Static Pages Generated<br/>");
            return $stringBuffer->toString();
        } catch ($e) {
            die $e;
        }
}

use java::util::HashMap;
# use java::util::HashSet;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::item::BasicItemData;
use org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntity;
use org::allbinary::data::tables::staticpages::StaticPagesEntity;
use org::allbinary::data::tables::user::commerce::inventory::item::InventoryEntity;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchParams;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::InputOutputTypeData;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::SpecialCharacterUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::string::tokens::UniqueTokens;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use views::generic::inventory::InventoryColumnUtil;
use views::generic::inventory::InventorySearchUtil;
use views::admin::inventory::listings::ProductListingInterface;

1;

