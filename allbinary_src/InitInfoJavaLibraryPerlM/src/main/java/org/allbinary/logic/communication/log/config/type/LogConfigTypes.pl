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

package org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $JSP_ERROR_NO_FUNCTION = "in JSP Not In Function";
our $LOGGING = 'org::allbinary::util::BasicArrayListD'->new();


{ # Java static initializer
        'org::allbinary::logic::communication::log::config::type::LogConfigTypes'->init();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($class) = @_;
        try {
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Initialize LogconfigTypes", "LogConfigTypes", "init()");
            'org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance();
            my $loggingInitInfo = 'org::allbinary::logic::communication::log::config::LoggingInitInfo'->new();
            my $logConfigTypeVector = $loggingInitInfo->getTypeList();
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Number Of Log Configs: " . $loggingInitInfo->getNumberOfLogConfigs(), "LogConfigTypes", "init()");
            'org::allbinary::logic::communication::log::PreLogUtil'->put("Number Of Log Config Type Names: " . $logConfigTypeVector->size(), "LogConfigTypes", "init()");
            $org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->addAllList($logConfigTypeVector);
            $org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->add('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{NETBEANS_MODULE});
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putSE("Unable to initialize LogConfigTypes", "LogConfigTypes", "init()", $e);
        }
}


# throws Exception
sub getInstance {
    my ($class, $node) = @_;
        my $nameValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::logic::communication::log::config::type::LogConfigTypeData'->getInstance()->{NAME}, $node->getChildNodes());
        my $name = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($nameValueNode);
        my $descriptionValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow('org::allbinary::logic::communication::log::config::type::LogConfigTypeData'->getInstance()->{DESCRIPTION}, $node->getChildNodes());
        if (defined($descriptionValueNode)) {
            my $description = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($descriptionValueNode);
        }
        my $availableLogConfigTypes = $org::allbinary::logic::communication::log::config::type::LogConfigType::availableLogConfigTypes;
        my $size = $availableLogConfigTypes->size();
        my $logConfigType = undef;
        for (my $index = 0; $index < $size; $index++) {
            $logConfigType = $availableLogConfigTypes->get($index);
            if ($logConfigType->getName()->compareTo($name) == 0) {
                return $logConfigType;
            }
        }
        die ("No Such LogConfigType: " . $name);
}

use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::communication::log::config::LoggingInitInfo;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::w3c::dom::Node;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeData;
use org::allbinary::logic::communication::log::config::type::LogConfigType;

1;

