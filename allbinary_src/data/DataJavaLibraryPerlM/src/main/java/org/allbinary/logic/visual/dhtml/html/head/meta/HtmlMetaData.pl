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

package org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "HTMLMETA_NAME";
    $self->{LABEL} = "HTMLMETA_LABEL";
    $self->{VALUE} = "meta";
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::dhtml::html::head::meta::HtmlMetaData::instance;
}


1;

