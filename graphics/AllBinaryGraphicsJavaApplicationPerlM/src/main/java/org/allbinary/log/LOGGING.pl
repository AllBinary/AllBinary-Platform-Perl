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
use parent -norequire,'java::lang::Object';

tie our $logging, 'java::lang::LazyStatic', sub { 'org::allbinary::util::BasicArrayListD'->new() };
tie our $GRAPHICSPAINT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Graphics Paint") };
tie our $GRAPHICSCREATION, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Graphics Creation") };
tie our $GRAPHICSDELETION, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Graphics Deletion") };
tie our $LOADINGERROR, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Loading Error") };
tie our $MENUEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Menu Action Event") };
tie our $MOUSEEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Mouse Action Event") };
tie our $KEYEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Keyboard Action Event") };
tie our $ACTIONEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Action Event") };
tie our $ADJUSTMENTEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Adjustment Action Event") };
tie our $COMPONENTEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Component Action Event") };
tie our $CONTAINEREVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Container Action Event") };
tie our $FOCUSEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Focus Action Event") };
tie our $HIERARCHYEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Hierarchy Action Event") };
tie our $INPUTEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Input Action Event") };
tie our $INVOCATIONEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Invocation Action Event") };
tie our $ITEMEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Item Action Event") };
tie our $PAINTEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Paint Action Event") };
tie our $TEXTEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Text Action Event") };
tie our $WINDOWEVENT, 'java::lang::LazyStatic', sub { 'org::allbinary::log::LOGGING'->new("Window Action Event") };

sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
}


sub new {
    my ($class, $value) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::logic::StdUtil ();

1;

