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

package org::allbinary::logic::visual::transform::info::dom::TransformInfoPropertiesDocument;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{document} = undef;
}


sub new {
    my ($class, $filePath) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $xmlFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($filePath);
        $self->{document} = 'org::allbinary::data::tree::dom::document::DomDocumentFileHelper'->createDocument($xmlFile);
    return $self;
}


sub toTransformInfoPropertiesHashMap {
    my ($self) = @_;
        try {
            my $transformInfoPropertiesHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            my $transformInfosNode = $self->{document}->getElementsByTagName('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{NAME})->item(0);
            my $transformInfosChildNodeList = $transformInfosNode->getChildNodes();
            my $transformInfoNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME}, $transformInfosChildNodeList);
            if ($org::allbinary::logic::visual::transform::info::dom::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::dom::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Size: " . $transformInfoNodeVector->size(), $self, "toTransformInfoPropertiesHashMap()");
            }
            my $size = $transformInfoNodeVector->size();
            my $node = undef;
            my $transformInfoProperties = undef;
            for (my $index = 0; $index < $size; $index++) {
                $node = $transformInfoNodeVector->get($index);
                $transformInfoProperties = 'org::allbinary::logic::visual::transform::info::TransformInfoPropertiesFactory'->getInstance()->getInstance($node);
                $transformInfoPropertiesHashMap->put($transformInfoProperties->getName(), $transformInfoProperties);
            }
            return $transformInfoPropertiesHashMap;
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::info::dom::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::dom::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "toTransformInfoPropertiesHashMap()", $e);
            }
            return undef;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentFileHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoProperties;
use org::allbinary::logic::visual::transform::info::TransformInfoPropertiesFactory;
use org::allbinary::logic::visual::transform::info::TransformInfosData;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;

1;

