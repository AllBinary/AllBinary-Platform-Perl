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

package org::allbinary::data::tree::dom::document::DocumentToNode;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $XMLROOT = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
our $XMLROOTSTART = "<?xml";
our $XMLROOTEND = "?>";
our $XMLJSPROOTSTART = "<jsp:root";
our $XMLEND = ">";
our $XMLJSPROOTENDSTART = "</jsp:root";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub convertDocumentToNodeString {
    my ($class, $documentString) = @_;
        $documentString = 'org::allbinary::data::tree::dom::document::DocumentToNode'->remove($documentString, $org::allbinary::data::tree::dom::document::DocumentToNode::XMLJSPROOTSTART, $org::allbinary::data::tree::dom::document::DocumentToNode::XMLEND);
        $documentString = 'org::allbinary::data::tree::dom::document::DocumentToNode'->remove($documentString, $org::allbinary::data::tree::dom::document::DocumentToNode::XMLJSPROOTENDSTART, $org::allbinary::data::tree::dom::document::DocumentToNode::XMLEND);
        my $replaceXmlRoot = 'org::allbinary::logic::string::regex::replace::Replace'->new($XMLROOT, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        return $replaceXmlRoot->all($documentString);
}


sub removeXmlDefinitionFromDocumentString {
    my ($class, $documentString) = @_;
        return 'org::allbinary::data::tree::dom::document::DocumentToNode'->remove($documentString, $XMLROOTSTART, $XMLROOTEND);
}


sub remove {
    my ($class, $documentString, $start, $end) = @_;
        my $startIndex = 0;
        while ((($startIndex = index($documentString, $start))) != -1) {
            if ($startIndex >= 0) {
                my $endIndex = index($documentString, $end, $startIndex);
                if ($endIndex >= 0) {
                    my $startString = substr($documentString, 0, ($startIndex) - (0));
                    my $resultString = substr($documentString, $endIndex + 1);
                    return $startString . $resultString;
                }
            }
        }
        return $documentString;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::regex::replace::Replace;

1;

