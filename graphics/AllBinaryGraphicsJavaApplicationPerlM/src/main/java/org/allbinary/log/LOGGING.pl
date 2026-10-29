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

package org::allbinary::log::LOGGING;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $logging = 'org::allbinary::util::BasicArrayListD'->new();
our $GRAPHICSPAINT = 'org::allbinary::log::LOGGING'->new("Graphics Paint");
our $GRAPHICSCREATION = 'org::allbinary::log::LOGGING'->new("Graphics Creation");
our $GRAPHICSDELETION = 'org::allbinary::log::LOGGING'->new("Graphics Deletion");
our $LOADINGERROR = 'org::allbinary::log::LOGGING'->new("Loading Error");
our $MENUEVENT = 'org::allbinary::log::LOGGING'->new("Menu Action Event");
our $MOUSEEVENT = 'org::allbinary::log::LOGGING'->new("Mouse Action Event");
our $KEYEVENT = 'org::allbinary::log::LOGGING'->new("Keyboard Action Event");
our $ACTIONEVENT = 'org::allbinary::log::LOGGING'->new("Action Event");
our $ADJUSTMENTEVENT = 'org::allbinary::log::LOGGING'->new("Adjustment Action Event");
our $COMPONENTEVENT = 'org::allbinary::log::LOGGING'->new("Component Action Event");
our $CONTAINEREVENT = 'org::allbinary::log::LOGGING'->new("Container Action Event");
our $FOCUSEVENT = 'org::allbinary::log::LOGGING'->new("Focus Action Event");
our $HIERARCHYEVENT = 'org::allbinary::log::LOGGING'->new("Hierarchy Action Event");
our $INPUTEVENT = 'org::allbinary::log::LOGGING'->new("Input Action Event");
our $INVOCATIONEVENT = 'org::allbinary::log::LOGGING'->new("Invocation Action Event");
our $ITEMEVENT = 'org::allbinary::log::LOGGING'->new("Item Action Event");
our $PAINTEVENT = 'org::allbinary::log::LOGGING'->new("Paint Action Event");
our $TEXTEVENT = 'org::allbinary::log::LOGGING'->new("Text Action Event");
our $WINDOWEVENT = 'org::allbinary::log::LOGGING'->new("Window Action Event");

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
}


sub new {
    my ($class, $value) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $value;
        $org::allbinary::log::LOGGING::logging->add($value);
    return $self;
}


sub contains {
    my ($class, $logType) = @_;
        return $org::allbinary::log::LOGGING::logging->contains($logType->toString());
}


sub toString {
    my ($self) = @_;
        return $self->{name};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;

1;

