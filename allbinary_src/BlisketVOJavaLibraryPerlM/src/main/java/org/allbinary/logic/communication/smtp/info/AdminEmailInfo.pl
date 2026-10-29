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

package org::allbinary::logic::communication::smtp::info::AdminEmailInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::smtp::info::BasicEmailInfo';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $subject, $textBody) = @_;
    my $self = $class->SUPER::new($subject, $textBody);
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::logic::communication::smtp::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, $commonStrings->{CONSTRUCTOR});
        }
        $self->init();
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        my $adminConfigurationInterface = 'org::allbinary::business::user::modules::admin::configuration::AdminConfiguration'->new();
        my $contextConfigurationInterface = $adminConfigurationInterface->getContextConfigurationInterface();
        my $emailServerConfigurationInterface = $contextConfigurationInterface->getEmailServerConfigurationInterface();
        $self->setEmailServerConfigurationInterface($emailServerConfigurationInterface);
}

use org::allbinary::business::context::configuration::ContextConfigurationInterface;
use org::allbinary::business::user::modules::admin::configuration::AdminConfiguration;
use org::allbinary::business::user::modules::admin::configuration::AdminConfigurationInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::smtp::info::BasicEmailInfo;

1;

