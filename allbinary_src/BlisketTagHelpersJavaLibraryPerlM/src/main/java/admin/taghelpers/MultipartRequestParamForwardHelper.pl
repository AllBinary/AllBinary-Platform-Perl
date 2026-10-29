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

package admin::taghelpers::MultipartRequestParamForwardHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{pageContext} = undef;
    $self->{requestMapInterface} = undef;
    $self->{page} = undef;
    $self->{command} = undef;
    $self->{paramVector} = undef;
}


sub new {
    my ($class, $parentHelperTag, $page, $command, $paramVector, $pageContext) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{pageContext} = $pageContext;
        $self->{page} = $page;
        $self->{command} = $command;
        $self->{paramVector} = $paramVector;
        $self->{requestMapInterface} = 'admin::taghelpers::InventoryItemViewParentTagHelper'->getInstance()->getRequestMapInterface($parentHelperTag);
    return $self;
}


# throws Exception
sub forward {
    my ($self) = @_;
        try {
            if ($self->shouldForward()) {
                my $params = $self->getParams();
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append($self->{page});
                $stringBuffer->append($params);
                $self->{pageContext}->forward($stringBuffer->toString());
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "forward()", $e);
            }
        }
}


sub getParams {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $AMP = $commonSeps->{AMPERSAND};
        my $QUESTION = $commonSeps->{QUESTION};
        my $EQUALS = $commonSeps->{EQUALS};
        my $hashMap = $self->{requestMapInterface}->getRequestHashMap();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = $self->{paramVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $key = $self->{paramVector}->get($index);
            my $value = $hashMap->get($key);
            if ($index != 0) {
                $stringBuffer->append($AMP);
            } else {
                $stringBuffer->append($QUESTION);
            }
            $stringBuffer->append($key);
            $stringBuffer->append($EQUALS);
            $stringBuffer->append($value);
        }
        return $stringBuffer->toString();
}


sub shouldForward {
    my ($self) = @_;
        my $hashMap = $self->{requestMapInterface}->getRequestHashMap();
        my $requestCommand = $hashMap->get($org::allbinary::globals::GLOBALS2::ADMINCOMMAND);
        if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{command}) || (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($requestCommand) && ($self->{command} cmp $requestCommand) == 0)) {
            return 1;
        }
        return 0;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::logic::communication::http::request::RequestMapInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use tags::HelperTag;
use admin::taghelpers::InventoryItemViewParentTagHelper;

1;

