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

package org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "TITLE_NAME";
    $self->{TEXT} = "TITLE_TEXT";
    $self->{VIEWNAMEKEY} = "Title";
    $self->{MAXLEN} = 255;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

