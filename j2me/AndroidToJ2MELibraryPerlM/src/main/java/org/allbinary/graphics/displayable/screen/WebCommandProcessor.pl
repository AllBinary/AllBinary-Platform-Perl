#
# AllBinary Open License Version 1
# Copyright (c) 2022 AllBinary
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

package org::allbinary::graphics::displayable::screen::WebCommandProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::displayable::screen::WebCommandProcessor'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{aboutCommandProcessor} = 'org::allbinary::graphics::displayable::screen::AboutCommandProcessor'->getInstance();
    $self->{WEB_VIEW_ACTIVITY} = "org.allbinary.android.activity.WebViewActivity";
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::screen::WebCommandProcessor::instance;
}


sub process {
    my ($self, $midletCommandListener, $command, $canvas) = @_;
        try {
            my $context = $self->{aboutCommandProcessor}->getContext();
            my $intent = 'android::content::Intent'->new($context, 'org::allbinary::TsUtil'->getInstance()->getClassClassLoader($self)->loadClass($self->{WEB_VIEW_ACTIVITY}));
            $intent->putExtra($self->{aboutCommandProcessor}->{URL}, $self->{list}->removeAt(0));
            $intent->setFlags($android::content::Intent::FLAG_ACTIVITY_NEW_TASK);
            $context->startActivity($intent);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "process", $e);
        }
}

use android::content::Context;
# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;
use android::content::Intent;
use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::displayable::screen::AboutCommandProcessor;

1;

