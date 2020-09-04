package com.caojing.play_android_flutter;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class TestJava {
    public static void main(String[] args) {
        String string = "runoob";
        String reverse = new StringBuffer(string).reverse().toString();
        System.out.println("字符串反转前:" + string);
        System.out.println("字符串反转后:" + reverse);
    }

    public int reverseInteger(int number) {
        String reverse = new StringBuffer(number + "").reverse().toString();
        return Integer.parseInt(reverse);
    }

    public char lowercaseToUppercase(char character) {
       return (char) (character-'a'+'A');
//        String str = String.valueOf(character);
//        return str.toUpperCase().charAt(0);
    }

    public Integer[] twoSum(int[] numbers, int target) {
        List<Integer> numbers2= new ArrayList();
        List<Integer> tags=new ArrayList<>();
        for (int i=numbers.length-1;i>=0;i--){
            if (numbers[i]<=target){
                numbers2.add(numbers[i]);
            }
        }

        for (int k=0;k<numbers2.size();k++){
            for (int j=0;j<numbers2.size();j++){
                if (numbers2.get(k)+numbers2.get(j)==target){
                    tags.add(k);
                    tags.add(j);
                    return tags.toArray(new Integer[tags.size()]);
                }
            }
        }

        return new Integer[0];
    }

    public Integer[] mergeSortedArray(int[] A, int[] B) {
        List<Integer> lists=new ArrayList();
        for (int i=0;i<A.length;i++){
            lists.add(A[i]);
        }
        for (int k=0;k<B.length;k++){
            lists.add(B[k]);
        }
        Collections.sort(lists);

        return lists.toArray(new Integer[lists.size()]);
    }
}
