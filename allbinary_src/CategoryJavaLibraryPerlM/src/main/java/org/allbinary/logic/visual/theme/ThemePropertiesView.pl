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

package org::allbinary::logic::visual::theme::ThemePropertiesView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{themeInterface} = undef;
}


sub new {
    my ($class, $themeInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{themeInterface} = $themeInterface;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::logic::visual::theme::ThemeData'->getInstance()->{NAME}, $self->{themeInterface}->toHashMap());
        return $node;
}

use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::theme::ThemeData;

1;

