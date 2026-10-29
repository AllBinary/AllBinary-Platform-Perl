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

#Note: if request is destroyed or messed up this will not work. Use fileRequestParams
package org::allbinary::logic::communication::http::request::RequestParams;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{map} = undef;
    $self->{KEY} = "Key: ";
    $self->{VALUE} = " Value: ";
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of RequestParams takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF("New RequestParams Size: 0", $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub _new1 {
    my ($class, $request) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{map} = $request->getParameterMap();
        $self->{logUtil}->putF("RequestParams Size: " . $self->getMap()->keySet()->size(), $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub _new1 {
    my ($class, $pageContext) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{map} = $pageContext->getRequest()->getParameterMap();
        $self->{logUtil}->putF("Request Params Size: " . $self->getMap()->keySet()->size(), $self, $self->{commonStrings}->{CONSTRUCTOR});
    return $self;
}


sub setMap {
    my ($self, $map) = @_;
        $self->{map} = $map;
}


sub getMap {
    my ($self) = @_;
        return $self->{map};
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $node = $document->createElement($org::allbinary::logic::communication::http::request::RequestData::REQUEST);
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            my $keys = $self->{map}->keySet();
            my $keyArray = $keys->toArray();
            my $size = scalar(@{$keyArray});
            for (my $i = 0; $i < $size; $i++) {
                my $key = $keyArray->[$i];
                my $values = $self->{map}->get($key);
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($self->{KEY});
                $stringBuffer->append($key);
                $stringBuffer->append($self->{VALUE});
                $stringBuffer->append($values->[0]);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "toXmlNode(document)");
                $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::communication::http::request::RequestData::PARAMETER, ("" . $key), ("" . $values->[0])));
            }
            return $node;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "toXmlNode(document)", $e);
            return undef;
        }
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $keys = $self->{map}->keySet();
        my $keyArray = $keys->toArray();
        my $size = scalar(@{$keyArray});
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        for (my $i = 0; $i < $size; $i++) {
            my $key = $keyArray->[$i];
            my $values = $self->{map}->get($key);
            $hashMap->put(("" . $key), ("" . $values->[0]));
        }
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append("RequestParams: ");
        $stringBuffer->append($self->{map}->toString());
        $stringBuffer->append("\ntoHashMap: ");
        $stringBuffer->append($hashMap->toString());
        $self->{logUtil}->putF($stringBuffer->toString(), $self, "toHashMap()");
        return $hashMap;
}

use java::util::HashMap;
# use java::util::Map;
# use java::util::Set;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::communication::http::request::RequestData;

1;

