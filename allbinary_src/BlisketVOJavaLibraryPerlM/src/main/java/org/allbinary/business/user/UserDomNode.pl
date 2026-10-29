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

package org::allbinary::business::user::UserDomNode;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{dataMappingInterface} = undef;
}


sub new {
    my ($class, $dataMappingInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{dataMappingInterface} = $dataMappingInterface;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        my $hashMap = $self->{dataMappingInterface}->toHashMap();
        $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{LASTMODIFIED}, $EMPTY_STRING);
        $hashMap->put('org::allbinary::business::entry::EntryData'->getInstance()->{ENCRYPTION}, $EMPTY_STRING);
        $hashMap->put($org::allbinary::business::user::UserData::PASSWORD, $EMPTY_STRING);
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::UserData::NAME, $hashMap);
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub view {
    my ($self) = @_;
        return undef;
}

use java::util::HashMap;
use org::allbinary::business::entry::EntryData;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::string::StringUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::UserData;

1;

