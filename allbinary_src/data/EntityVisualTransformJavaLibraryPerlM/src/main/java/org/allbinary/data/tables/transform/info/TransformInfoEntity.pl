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

package org::allbinary::data::tables::transform::info::TransformInfoEntity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlBean','org::allbinary::data::tables::transform::info::TransformInfoEntityInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tableName} = "transforminfo";
    $self->{abeClientInformation} = 'org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory'->getInstance();
    $self->{transformInfoFactoryInterface} = undef;
    $self->{transformInfoObjectConfigAndManipulatorFactoryInterface} = undef;
    $self->{transformInfoObjectConfigGeneratorFactoryInterface} = undef;
}


sub new {
    my ($class, $transformInfoObjectConfigGeneratorFactoryInterface, $transformInfoObjectConfigAndManipulatorFactoryInterface, $transformInfoFactoryInterface) = @_;
    my $self = $class->SUPER::new('org::allbinary::business::init::db::UserDbInitInfo'->new());
    $self->_init_fields();
        # super(...) made $self above
        $self->setTableName($self->{tableName});
        $self->{transformInfoObjectConfigGeneratorFactoryInterface} = $transformInfoObjectConfigGeneratorFactoryInterface;
        $self->{transformInfoObjectConfigAndManipulatorFactoryInterface} = $transformInfoObjectConfigAndManipulatorFactoryInterface;
        $self->{transformInfoFactoryInterface} = $transformInfoFactoryInterface;
    return $self;
}


sub insert {
    my ($self, $values) = @_;
        try {
            $self->SUPER::insert($values);
            if ($org::allbinary::data::tables::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{INSERT});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{INSERT}, $e);
            }
        }
}


sub delete {
    my ($self, $value) = @_;
        try {
            $self->SUPER::deleteWhere('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}, $value);
            if ($org::allbinary::data::tables::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->putF($self->{commonStrings}->{SUCCESS}, $self, $self->{commonStrings}->{delete});
            }
        } catch ($e) {
            if ($org::allbinary::data::tables::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::data::tables::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, $self->{commonStrings}->{delete}, $e);
            }
        }
}


# throws Exception
sub get {
    my ($self, $name, $propertiesHashMap, $pageContext) = @_;
        my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
        my $keysAndValues = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $keysAndValues->put($transformInfoData->{NAME}, $name);
        my $hashMap = $self->SUPER::getRow($keysAndValues);
        if (defined($hashMap)) {
            my $anyType = $hashMap->get($transformInfoData->{OBJECTCONFIG});
            if (defined($anyType)) {
                my $string = $anyType;
                $hashMap->put($transformInfoData->{OBJECTCONFIG}, ("" . 'org::allbinary::logic::control::crypt::Encoder'->decode($string)));
            }
            my $objectData = $hashMap->get($transformInfoData->{DATA});
            if (defined($objectData)) {
                my $string = $objectData;
                $hashMap->put($transformInfoData->{DATA}, ("" . 'org::allbinary::logic::control::crypt::Encoder'->decode($string)));
            }
            return $self->{transformInfoFactoryInterface}->getInstance($hashMap, $propertiesHashMap, $pageContext);
        } else {
            return undef;
        }
}


# throws Exception
sub getObjectConfigs {
    my ($self, $storeName) = @_;
        my $objectConfigVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $objectConfigColumnVector = $self->getColumnWhere('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{OBJECTCONFIG}, 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
        my $size = $objectConfigColumnVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $objectConfigString = $objectConfigColumnVector->get($i);
            $objectConfigString = ("" . 'org::allbinary::logic::control::crypt::Encoder'->decode($objectConfigString));
            $objectConfigVector->add($self->{transformInfoObjectConfigAndManipulatorFactoryInterface}->getInstance($self->{abeClientInformation}, $self, 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($objectConfigString)));
        }
        return $objectConfigVector;
}


# throws Exception
sub getNames {
    my ($self, $storeName) = @_;
        my $viewNameVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $columnVector = $self->getColumnWhere('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}, 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
        my $size = $columnVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $viewNameString = $columnVector->get($i);
            $viewNameVector->add($viewNameString);
        }
        return $viewNameVector;
}


sub createTableStatement {
    my ($self) = @_;
        my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{CREATE_TABLE});
        $stringBuffer->append($self->{tableName});
        $stringBuffer->append($self->{sqlStrings}->{START});
        $stringBuffer->append($transformInfoData->{NAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($transformInfoData->{OBJECTFILENAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($transformInfoData->{OBJECT});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($transformInfoData->{OBJECTCONFIGFILENAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($transformInfoData->{OBJECTCONFIG});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($transformInfoData->{TEMPLATEFILENAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($transformInfoData->{TEMPLATE});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append($transformInfoData->{DATAFILENAME});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_CHAR_COLUMN_NOT_NULL});
        $stringBuffer->append($transformInfoData->{DATA});
        $stringBuffer->append($self->{sqlTypeStrings}->{BLOB_NOT_NULL});
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED});
        $stringBuffer->append('org::allbinary::business::entry::EntryData'->getInstance()->{TIMECREATED});
        $stringBuffer->append($self->{sqlTypeStrings}->{MAX_BIG_INT_UNSIGNED_NOT_NULL});
        $stringBuffer->append($self->{sqlStrings}->{PRIMARY_KEY});
        $stringBuffer->append($transformInfoData->{NAME});
        $stringBuffer->append($self->{sqlStrings}->{END});
        return $stringBuffer->toString();
}


sub createTable {
    my ($self) = @_;
        return $self->SUPER::createTable($self->createTableStatement());
}


sub update {
    my ($self, $updatedValues) = @_;
        $self->SUPER::updateWhere('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}, $updatedValues->get('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}), $updatedValues);
}


sub dropTable {
    my ($self) = @_;
        return $self->SUPER::dropTable();
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::business::init::db::UserDbInitInfo;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::sql::AbSqlBean;
use org::allbinary::logic::control::crypt::Encoder;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::ServiceClientInformationInterfaceFactory;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoFactoryInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactoryBase;
use org::allbinary::logic::visual::transform::info::objectConfig::generator::TransformInfoObjectConfigGeneratorFactoryInterface;
use org::allbinary::data::tables::transform::info::TransformInfoEntityInterface;

1;

