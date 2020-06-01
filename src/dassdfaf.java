public class dassdfaf {
    public static void main(String[] args) {

        int n=6;
        int[] arr1 = {1,33,33,22,31,50};
        int[] arr2 = {1,56,19,14,14,10};
        int[] arr3 = new int[n];
        int[] arr4 = new int[n];
        String[] answer = new String[n];

        for(int i=0;i<n;i++){

            arr3[i]=arr1[i]|arr2[i];

            System.out.print("("+arr3[i]+")");
            for (int j=5;j>-1;j--){
                arr4[j]=arr3[i]%2;
                arr3[i]/=2;
                if(arr3[i]==0){
                    while(j>0){
                        arr4[j-1]=0;
                        j--;
                    }
                    break;
                }
        }
            for (int k=0;k<6;k++){

                if(arr4[k]==1){
                    System.out.print("#");
                }else{
                    System.out.print(" ");
                }
            }
            System.out.println();
        }

    }
}
