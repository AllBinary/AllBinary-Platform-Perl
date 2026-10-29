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

package org::allbinary::business::user::commerce::money::tax::TaxFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::money::tax::TaxFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{TAXATIONFILENAME} = "taxationMethod.xml";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::tax::TaxFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $abeClientInformation, $storeFrontInterface) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
        $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
        $stringBuffer->append($storeFrontInterface->getName());
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $stringBuffer->append("generic");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $stringBuffer->append("taxes");
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        my $abPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), $self->{TAXATIONFILENAME});
        my $transformInfoObjectConfigData = 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance();
        my $data = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new($transformInfoObjectConfigData->{UNCRYPTED_EXTENSION}, $transformInfoObjectConfigData->{ENCRYPTED_EXTENSION})->get($abPath);
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($data);
        my $taxNameNodeList = $document->getElementsByTagName($org::allbinary::business::user::commerce::money::tax::components::TaxData::NAME);
        for (my $index = 0; $index < $taxNameNodeList->getLength(); $index++) {
            my $node = $taxNameNodeList->item($index);
            my $nodeList = $node->getChildNodes();
            if (defined($nodeList)) {
                my $classNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::DynamicObjectData::NAME, $nodeList);
                if (defined($classNameNode)) {
                    my $className = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($classNameNode);
                    return 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $className);
                } else {
                    if ($org::allbinary::business::user::commerce::money::tax::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::tax::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAX})) {
                        $self->{logUtil}->putF("Class Node Null", $self, $self->{commonStrings}->{GET_INSTANCE});
                    }
                }
            } else {
                if ($org::allbinary::business::user::commerce::money::tax::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::tax::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAX})) {
                    $self->{logUtil}->putF("Tax Name Node Node Children", $self, $self->{commonStrings}->{GET_INSTANCE});
                }
            }
        }
        return 'org::allbinary::business::user::commerce::money::tax::modules::SimpleStateTaxModule'->new();
}

use org::allbinary::business::DynamicObjectData;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::money::tax::components::TaxData;
use org::allbinary::business::user::commerce::money::tax::modules::SimpleStateTaxModule;
use org::allbinary::business::user::commerce::money::tax::modules::TaxModuleInterface;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::loader::AbeFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

