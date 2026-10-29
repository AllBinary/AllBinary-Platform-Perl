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

package org::allbinary::game::configuration::feature::GameFeatureItemCommandListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'javax::microedition::lcdui::ItemCommandListener';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{gameOptionsForm} = undef;
}


sub new {
    my ($class, $gameOptionsForm) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{gameOptionsForm} = $gameOptionsForm;
    return $self;
}


sub commandAction {
    my ($self, $command, $item) = @_;
        try {
            my $itemLabel = $item->getLabel();
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{ITEM_LABEL})->append($itemLabel)->toString(), $self, 'org::allbinary::midlet::MidletStrings'->getInstance()->{COMMAND_ACTION});
            if ((Scalar::Util::blessed($item) && $item->isa('org::allbinary::game::configuration::GameConfigurationGauge'))) {
                'org::allbinary::game::configuration::GameConfigurationUtil'->getInstance()->change($self->{gameOptionsForm}, $item);
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, 'org::allbinary::midlet::MidletStrings'->getInstance()->{COMMAND_ACTION}, $e);
        }
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::Item;
# use javax::microedition::lcdui::ItemCommandListener;
use org::allbinary::game::configuration::GameConfigurationGauge;
use org::allbinary::game::configuration::GameConfigurationUtil;
use org::allbinary::game::configuration::GameOptionsForm;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::midlet::MidletStrings;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;

1;

