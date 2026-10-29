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

package org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeData'->new(0, "HTMLMETA_ATTRIBUTE_NAME");
    $self->{HTTP_EQUIV} = 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeData'->new(1, "HTMLMETA_ATTRIBUTE_HTTPEQUIV");
    $self->{CONTENT} = 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeData'->new(2, "HTMLMETA_ATTRIBUTE_CONTENT");
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeDataFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}

use org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaAttributeData;

1;

