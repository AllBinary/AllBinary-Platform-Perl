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

package org::allbinary::logic::control::workflow::request::BasicWorkFlow;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{workFlowDoc} = undef;
    $self->{workFlowName} = undef;
    $self->{storeName} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of BasicWorkFlow takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{workFlowName} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        $self->{workFlowDoc} = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        my $workFlowNode = $self->{workFlowDoc}->createElement('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{WORKFLOW});
        $self->{workFlowDoc}->appendChild($workFlowNode);
    return $self;
}


sub _new2 {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $weblisketSession = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
        $self->{storeName} = $weblisketSession->getStoreName();
        my $requestHashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($pageContext)->toHashMap();
        $self->{workFlowName} = $requestHashMap->get('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME});
        $self->{workFlowDoc} = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($requestHashMap->get('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{DATA}));
    return $self;
}


sub _new1 {
    my ($class, $hashMap) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{workFlowName} = $hashMap->get('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME});
        $self->{storeName} = $hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $self->{workFlowDoc} = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($hashMap->get('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{DATA}));
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{workFlowName};
}


sub getStoreName {
    my ($self) = @_;
        return $self->{storeName};
}


sub getKey {
    my ($self) = @_;
        return $self->getName();
}


# throws Exception
sub toVector {
    my ($self) = @_;
        my $values = 'org::allbinary::util::BasicArrayListD'->new();
        $values->add($self->{workFlowName});
        $values->add($self->{storeName});
        $values->add('org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->{workFlowDoc}));
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $values->add($time);
        $values->add($time);
        return $values;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{NAME}, $self->{workFlowName});
        $hashMap->put('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $self->{storeName});
        $hashMap->put('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{DATA}, 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->{workFlowDoc}));
        my $calendar = 'java::util::Calendar'->getInstance();
        my $time = ("" . $calendar->getTimeInMillis()->toString());
        $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $time);
        return $hashMap;
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $hashMap = $self->toHashMap();
            my $keySet = $hashMap->keySet();
            my $node = $document->createElement('org::allbinary::logic::control::workflow::WorkFlowData'->getInstance()->{WORKFLOW});
            my $nameArray = $keySet->toArray();
            my $size = scalar(@{$nameArray});
            for (my $index = 0; $index < $size; $index++) {
                my $name = $nameArray->[$index];
                my $value = $hashMap->get($name);
                $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
            }
            return $node;
        } catch ($e) {
            if ($org::allbinary::logic::control::workflow::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "toXmlNode()", $e);
            }
            return undef;
        }
}


sub toXmlDoc {
    my ($self) = @_;
        try {
            return $self->{workFlowDoc};
        } catch ($e) {
            if ($org::allbinary::logic::control::workflow::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "toXmlDoc()", $e);
            }
            return undef;
        }
}


sub isValid {
    my ($self) = @_;
        try {
            my $returnBoolean = 1;
            if (!defined($self->{workFlowName})) {
                $returnBoolean = 0;
            }
            return $returnBoolean;
        } catch ($e) {
            if ($org::allbinary::logic::control::workflow::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            if (!defined($self->{workFlowName})) {
                $stringBuffer->append("No WorkFlow name specified.");
            }
            return $stringBuffer->toString();
        } catch ($e) {
            if ($org::allbinary::logic::control::workflow::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Getting Validation Info";
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

use java::util::Calendar;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::entry::EntryData;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::workflow::WorkFlowData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

