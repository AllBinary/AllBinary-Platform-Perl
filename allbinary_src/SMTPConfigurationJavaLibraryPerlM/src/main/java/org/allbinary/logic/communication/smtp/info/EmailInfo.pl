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

package org::allbinary::logic::communication::smtp::info::EmailInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{basicEmailInfo} = undef;
    $self->{htmlAttachment} = undef;
    $self->{contentBase} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of EmailInfo takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $basicEmailInfo) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, $commonStrings->{CONSTRUCTOR});
        }
        $self->init($basicEmailInfo, undef, undef);
    return $self;
}


sub _new3 {
    my ($class, $basicEmailInfo, $htmlAttachment, $contentBase) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::logic::communication::smtp::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::smtp::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{EMAILLOGGING})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF($commonStrings->{START}, $self, $commonStrings->{CONSTRUCTOR});
        }
        $self->init($basicEmailInfo, undef, undef);
    return $self;
}


sub init {
    my ($self, $basicEmailInfo, $htmlAttachment, $contentBase) = @_;
        $self->{basicEmailInfo} = $basicEmailInfo;
        $self->{htmlAttachment} = $htmlAttachment;
        $self->{contentBase} = $contentBase;
}


sub getBasicEmailInfo {
    my ($self) = @_;
        return $self->{basicEmailInfo};
}


sub getHtmlAttachment {
    my ($self) = @_;
        return $self->{htmlAttachment};
}


sub getContentBase {
    my ($self) = @_;
        return $self->{contentBase};
}


sub toString {
    my ($self) = @_;
        return "Email Info: \n " . $self->getBasicEmailInfo()->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

