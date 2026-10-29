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

package org::allbinary::logic::communication::http::AcceptableResponseGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::http::AcceptableResponseGenerator'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::http::AcceptableResponseGenerator::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub get {
    my ($self, $httpServletRequest) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            my $acceptableResponseUtil = 'org::allbinary::logic::communication::http::AcceptableResponseUtil'->getInstance();
            my $acceptable = $httpServletRequest->getHeader("accept");
            my $result = $acceptableResponseUtil->getTagName(0);
            if ($org::allbinary::logic::communication::http::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTP})) {
                $self->{logUtil}->putF("Request Type: " . $acceptable, $self, $commonStrings->{GET});
            }
            if (defined($acceptable)) {
                my $size = $acceptableResponseUtil->size();
                for (my $index = 0; $index < $size; $index++) {
                    if (($acceptable cmp $acceptableResponseUtil->get($index)) == 0) {
                        $result = $acceptableResponseUtil->getTagName($index);
                    }
                }
            }
            if ($org::allbinary::logic::communication::http::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTP})) {
                $self->{logUtil}->putF("Response Type: " . $result, $self, $commonStrings->{GET});
            }
            return $result;
        } catch ($e) {
            if ($org::allbinary::logic::communication::http::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET}, $e);
            }
            die $e;
        }
}

# use javax::servlet::http::HttpServletRequest;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::http::AcceptableResponseUtil;

1;

