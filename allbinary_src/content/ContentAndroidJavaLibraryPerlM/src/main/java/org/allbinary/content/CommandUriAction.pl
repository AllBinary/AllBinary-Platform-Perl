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

package org::allbinary::content::CommandUriAction;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::content::CommandUriAction'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{hashtable} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::content::CommandUriAction::instance;
}


sub add {
    my ($self, $command, $url) = @_;
        $self->{hashtable}->put($command, $url);
}


sub process {
    my ($self, $command) = @_;
        try {
            my $intent = $self->getIntent($command);
            'org::allbinary::data::resource::ResourceUtil'->getInstance()->getContext()->startActivity($intent);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{PROCESS}, $e);
        }
}


sub getIntent {
    my ($self, $command) = @_;
        my $url = $self->{hashtable}->get($command);
        my $uri = 'android::net::Uri'->parse($url);
        my $intent = 'android::content::Intent'->new($android::content::Intent::ACTION_VIEW, $uri);
        return $intent;
}

# use javax::microedition::lcdui::Command;
use android::content::Intent;
use android::net::Uri;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;

1;

