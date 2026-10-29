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

package org::allbinary::logic::visual::theme::ThemeData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::theme::ThemeData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "THEME_NAME";
    $self->{PATH} = "THEME_PATH";
    $self->{PREVIEW_IMAGE_NAME} = "THEME_PREVIEW_IMAGE_NAME";
    $self->{PREVIEW_IMAGE_PATH} = "THEME_PREVIEW_IMAGE_PATH";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::theme::ThemeData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

