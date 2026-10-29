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

package org::allbinary::logic::communication::smtp::info::BasicEmailInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{subject} = undef;
    $self->{textBody} = undef;
    $self->{emailServerConfigurationInterface} = undef;
}


sub new {
    my ($class, $subject, $textBody) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, $commonStrings->{CONSTRUCTOR});
        }
        $self->{subject} = $subject;
        $self->{textBody} = $textBody;
    return $self;
}


sub getSubject {
    my ($self) = @_;
        return $self->{subject};
}


sub getTextBody {
    my ($self) = @_;
        return $self->{textBody};
}


sub getEmailServerConfigurationInterface {
    my ($self) = @_;
        return $self->{emailServerConfigurationInterface};
}


sub setEmailServerConfigurationInterface {
    my ($self, $emailServerConfigurationInterface) = @_;
        $self->{emailServerConfigurationInterface} = $emailServerConfigurationInterface;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->getEmailServerConfigurationInterface()->toString());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append("Subject: \n");
        $stringBuffer->append($self->getSubject());
        $stringBuffer->append("\nText Body: \n");
        $stringBuffer->append($self->getTextBody());
        return $stringBuffer->toString();
}


# throws Exception
sub init {
    my ($self) = @_;
        die ("RuntimeException");
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::smtp::configuration::server::EmailServerConfigurationInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;

1;

