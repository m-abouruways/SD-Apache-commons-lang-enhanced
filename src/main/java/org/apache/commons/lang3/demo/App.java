/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.apache.commons.lang3.demo;

import org.apache.commons.lang3.StringUtils;

/**
 * Simple demo entry point used to package and run this project inside Docker.
 *
 * <p>This class does not change the behavior of the Commons Lang library.</p>
 */
public class App {

    /**
     * Runs a small demonstration using {@link StringUtils}.
     *
     * @param args optional command line arguments; the first one is used as input
     */
    public static void main(final String[] args) {
        final String input = args.length > 0 ? args[0] : "ab12cd34";
        System.out.println("Input: " + input);
        System.out.println("Digits: " + StringUtils.getDigits(input));
        System.out.println("IsMixedCase: " + StringUtils.isMixedCase(input));
        System.out.println("Done OK");
    }
}